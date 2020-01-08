add_library(
	config
	STATIC
	include/config/config.h
	include/config/functions.h
	include/config/state.h
	include/config/yaml.h
	src/config.cpp
	version.cpp
)

target_include_directories(config PUBLIC include)
target_link_libraries(config PUBLIC util vita-headers yaml-cpp)
