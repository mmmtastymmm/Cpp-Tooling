cmake_minimum_required(VERSION 3.22)
project(CppTooling)

# Add the build types
include(cmake/Build_Types.cmake)
# Add the clang format package using cmake
include(cmake/CPM.cmake)
# Add the testing framework, using doctest here
cpmaddpackage(NAME catch2 GITHUB_REPOSITORY catchorg/Catch2 GIT_TAG v2.13.10)

# Add the formatting code, here format.cmake since it integrates so easily with
# cmake
cpmaddpackage(NAME Format.cmake GITHUB_REPOSITORY TheLartians/Format.cmake
              GIT_TAG v1.7.3)
# The CPP standard, here we are using C++20
set(CMAKE_CXX_STANDARD 20)
# Export the compile commands, which is a json file with all the commands needed
# to build all the targets
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
# CHANGE THIS. Currently adds one target, which is a hello world executable
# right now. May have to switch to a library.
add_executable(cpp_tooling main.cpp)

# Add compile flags to the tooling repo
target_compile_options(cpp_tooling PRIVATE -Wall -Wpedantic -Wshadow
                                           -Wconversion -Wextra -Werror)
# Optionally enable the unit tests
set(BUILD_TESTS
    TRUE
    CACHE BOOL "Enable the projects tests")

if(${BUILD_TESTS})
  message(STATUS "Did enable unit tests for ${CMAKE_PROJECT_NAME}")
  # Will enable tests now
  enable_testing()
  # Add one executable target for the unit tests
  add_executable(unit_tests test/unit_tests.cpp test/catch_main.cpp)
  # Link with the catch2 main file
  target_link_libraries(unit_tests PRIVATE Catch2)
  # Add a test for ctest
  add_test(NAME "UnitTests" COMMAND unit_tests)
else()
  message(STATUS "Did NOT enable unit tests for ${CMAKE_PROJECT_NAME}")
endif()
