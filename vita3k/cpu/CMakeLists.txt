add_library(
	cpu
	STATIC
	include/cpu/arm.h
	include/cpu/functions.h
	include/cpu/injection.h
	include/cpu/state.h
	include/cpu/util.h
	src/arm.cpp
	src/cpu.cpp
)

target_include_directories(cpu PUBLIC include)
target_link_libraries(cpu PUBLIC disasm mem)
target_link_libraries(cpu PRIVATE unicorn)
