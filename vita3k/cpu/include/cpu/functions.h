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

#pragma once

#include <cpu/util.h>

#include <cstdint>
#include <stack>

struct CPUState;

struct CPUDepInject;
struct StackFrame;

uint32_t stack_alloc(CPUState &state, size_t size);
uint32_t stack_free(CPUState &state, size_t size);
std::stack<StackFrame> get_stack_frames(CPUState &state);
void push_stack_frame(CPUState &state, StackFrame sf);
void log_stack_frames(CPUState &cpu);
void push_lr(CPUState &cpu, Address lr);
Address pop_lr(CPUState &cpu);

bool is_returning(CPUState &cpu);
bool hit_breakpoint(CPUState &state);
void trigger_breakpoint(CPUState &state);
bool log_code_exists(CPUState &state);
bool log_mem_exists(CPUState &state);
void save_context(CPUState &state, CPUContext &ctx);
void load_context(CPUState &state, CPUContext &ctx);
void set_thread_id(CPUState &state, SceUID thread_id);
SceUID get_thread_id(CPUState &state);
