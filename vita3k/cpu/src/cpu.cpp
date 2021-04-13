// Vita3K emulator project
// Copyright (C) 2018 Vita3K team
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#include <cpu/arm.h>
#include <cpu/functions.h>
#include <cpu/injection.h>
#include <cpu/state.h>

#include <mem/state.h>
#include <util/log.h>

#include <cassert>

std::stack<StackFrame> get_stack_frames(CPUState &state) {
    return state.stack_frames;
}

void push_stack_frame(CPUState &state, StackFrame sf) {
    state.stack_frames.push(sf);
}

std::unique_ptr<ModuleRegion> get_region(CPUState &state, Address addr) {
    for (const auto &region : state.module_regions) {
        if (region.start <= addr && addr < region.start + region.size) {
            return std::make_unique<ModuleRegion>(region);
        }
    }
    return nullptr;
}

void log_stack_frames(CPUState &cpu) {
    auto sfs = get_stack_frames(cpu);
    LOG_INFO("stack information");
    int i = 0;
    while (!sfs.empty() && i < 50) {
        i++;
        auto sf = sfs.top();
        sfs.pop();

        auto region = get_region(cpu, sf.addr);
        assert(region);
        auto vaddr = sf.addr - region->start + region->vaddr;
        LOG_INFO("---------");
        LOG_INFO("module: {}", region->name);
        LOG_INFO("vaddr: {}", log_hex(vaddr));
        LOG_INFO("addr: {}", log_hex(sf.addr));
        LOG_INFO("fp: {}", sf.sp);
    }
}

bool is_returning(CPUState &cpu) {
    return cpu.returning;
}

void push_lr(CPUState &cpu, Address lr) {
    cpu.lr_stack.push(lr);
}

Address pop_lr(CPUState &cpu) {
    int out = cpu.lr_stack.top();
    cpu.lr_stack.pop();
    return out;
}

uint32_t stack_alloc(CPUState &state, size_t size) {
    const uint32_t new_sp = read_sp(state) - size;
    write_sp(state, new_sp);
    return new_sp;
}

uint32_t stack_free(CPUState &state, size_t size) {
    const uint32_t new_sp = read_sp(state) + size;
    write_sp(state, new_sp);
    return new_sp;
}

bool hit_breakpoint(CPUState &state) {
    return state.did_break;
}

void trigger_breakpoint(CPUState &state) {
    stop(state);
    state.did_break = true;
}

bool log_code_exists(CPUState &state) {
    return state.code_hook != 0;
}

bool log_mem_exists(CPUState &state) {
    return state.memory_read_hook != 0 && state.memory_write_hook != 0;
}

static void delete_cpu_context(CPUContext *ctx) {
    delete ctx;
}

void save_context(CPUState &state, CPUContext &ctx) {
    for (auto i = 0; i < 16; i++) {
        ctx.cpu_registers[i] = read_reg(state, i);
    }

    ctx.pc = read_pc(state);
    ctx.lr = read_lr(state);
    ctx.sp = read_sp(state);
}

void set_thread_id(CPUState &state, SceUID thread_id) {
    state.thread_id = thread_id;
}

SceUID get_thread_id(CPUState &state) {
    return state.thread_id;
}
