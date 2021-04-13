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

#include <mem/util.h>

struct CPUContext {
    uint32_t cpu_registers[16];
    uint32_t sp;
    uint32_t pc;
    uint32_t lr;
    uint32_t cpsr;
};

struct StackFrame {
    uint32_t addr;
    uint32_t sp;
    std::string name;
};

struct ModuleRegion {
    uint32_t nid;
    std::string name;
    Address start;
    uint32_t size;
    Address vaddr;
};

struct CPUDepInject {
    CallImport call_import;
    CallSVC call_svc;
    ResolveNIDName resolve_nid_name;
    GetWatchMemoryAddr get_watch_memory_addr;
    std::vector<ModuleRegion> module_regions;
    bool trace_stack;
};
