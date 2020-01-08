macro(configure_boost)
	message("configuring boost")

	set(Boost_USE_STATIC_LIBS ON)
	set(Boost_USE_MULTITHREADED ON)
	set(BOOST_COMPONENTS filesystem program_options system)

	find_package(Boost COMPONENTS ${BOOST_COMPONENTS} REQUIRED)

	include_directories(${Boost_INCLUDE_DIRS})

	if(Boost_FOUND)
		message("Using Boost_VERSION: ${Boost_VERSION}")
		message("Using Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
		message("Using Boost_LIBRARY_DIRS: ${Boost_LIBRARY_DIRS}")
	else()
		message("Boost library is not found")
	endif()
endmacro(configure_boost)

configure_boost()

if (USE_GDBSTUB)
	add_definitions(-DUSE_GDBSTUB)
endif()

if (USE_VULKAN)
	add_definitions(-DUSE_VULKAN)
endif()

add_subdirectory(audio)
add_subdirectory(config)
add_subdirectory(cpu)
add_subdirectory(crypto)
add_subdirectory(ctrl)
add_subdirectory(dialog)
add_subdirectory(disasm)
add_subdirectory(features)
add_subdirectory(glutil)
add_subdirectory(gxm)
add_subdirectory(net)
add_subdirectory(np)
add_subdirectory(io)
add_subdirectory(kernel)
add_subdirectory(mem)
add_subdirectory(module)
add_subdirectory(modules)
add_subdirectory(nids)
add_subdirectory(renderer)
add_subdirectory(rtc)
add_subdirectory(shader)
add_subdirectory(threads)
add_subdirectory(touch)
add_subdirectory(util)

if(USE_GDBSTUB)
	add_subdirectory(gdbstub)
endif()

add_subdirectory(host)

# An empty file is used as a placeholder to make this an independent library
add_library(lib SHARED null.cpp)
target_link_libraries(lib PUBLIC host)

set_target_properties(lib PROPERTIES OUTPUT_NAME libVita3K
	ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
	LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
	RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
