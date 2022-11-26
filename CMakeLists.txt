cmake_minimum_required(VERSION 3.22)
project(CppTooling)

# Add the build types
include(cmake/Sanitizers.cmake)
# Add the clang format package using cmake
include(cmake/CPM.cmake)
cpmaddpackage("gh:TheLartians/Format.cmake@1.7.3")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

add_executable(cpp_tooling main.cpp)
target_link_libraries(cpp_tooling)
add_executable(unit_tests test/unit_tests.cpp)

target_compile_options(cpp_tooling PRIVATE -Wall -Wpedantic -Wshadow
                                           -Wconversion -Wextra )

include(CTest)

set(BUILD_TESTS
    TRUE
    CACHE BOOL "Enable the projects tests")

if(${BUILD_TESTS})
  add_test(NAME "Unit Tests" COMMAND unit_tests)
else()
  message("No")
endif()
