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

#include <mem/util.h> // Address.
#include <util/types.h>

#include <functional>
#include <memory>

struct CPUState;
struct CPUContext;

typedef std::function<void(CPUState &cpu, uint32_t, Address)> CallSVC;
typedef std::function<void(CPUState &cpu, uint32_t, SceUID)> CallImport;
typedef std::function<std::string(Address)> ResolveNIDName;
typedef std::function<Address(Address)> GetWatchMemoryAddr;
typedef std::unique_ptr<CPUState, std::function<void(CPUState *)>> CPUStatePtr;
typedef std::unique_ptr<CPUContext, std::function<void(CPUContext *)>> CPUContextPtr;

enum ImportCallLogLevel {
    None,
    LogCall,
    LogCallAndReturn
};

union DoubleReg {
    double d;
    float f[2];
};

constexpr ImportCallLogLevel IMPORT_CALL_LOG_LEVEL = None;

constexpr bool LOG_REGISTERS = false;
constexpr bool TRACE_RETURN_VALUES = true;

constexpr uint32_t INT_SVC = 2;
constexpr uint32_t INT_BKPT = 7;
