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

#include <disasm/state.h>

#include <unicorn/unicorn.h>

struct ModuleRegion;
struct StackFrame;

typedef std::unique_ptr<uc_struct, std::function<void(uc_struct *)>> UnicornPtr;

struct CPUState {
    SceUID thread_id;
    MemState *mem = nullptr;
    CallSVC call_svc;
    ResolveNIDName resolve_nid_name;
    DisasmState disasm;
    GetWatchMemoryAddr get_watch_memory_addr;
    UnicornPtr uc;
    uc_hook memory_read_hook = 0;
    uc_hook memory_write_hook = 0;
    uc_hook code_hook = 0;
    bool returning = false;
    std::stack<Address> lr_stack;

    bool did_break = false;
    bool did_inject = false;

    std::vector<ModuleRegion> module_regions;
    std::stack<StackFrame> stack_frames;
};
