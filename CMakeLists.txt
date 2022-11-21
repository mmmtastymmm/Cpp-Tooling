cmake_minimum_required(VERSION 3.22)
project(CppTooling)

set(CMAKE_CXX_STANDARD 20)

add_executable(Cpp-Tooling main.cpp)
add_executable(unit_tests test/unit_tests.cpp)

include(CTest)

set(BUILD_TESTS TRUE CACHE BOOL "Enable the projects tests")


if(${BUILD_TESTS})
    add_test(
            NAME "Unit Tests"
            COMMAND unit_tests
    )
else()
    message("No")
endif()

