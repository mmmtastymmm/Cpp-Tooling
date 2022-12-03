# Ensure the sanitizers are catching simple test
message(${CMAKE_BUILD_TYPE})
if(${CMAKE_BUILD_TYPE} STREQUAL "MemorySanitizer")
  message(STATUS "Did enable memory sanitizer tests for ${CMAKE_PROJECT_NAME}")
  # Will enable tests now
  enable_testing()
  # Add one executable target for the unit tests
  add_executable(memory_sanitizer_fail_test
                 ../test/test_sanitizers_working/test_memory_sanitizer.cpp)
  # Link with the catch2 main file
  target_link_libraries(memory_sanitizer_fail_test PRIVATE Catch2)
  # Add a test for ctest
  add_test(NAME "memory_sanitizer_fail_test" COMMAND memory_sanitizer_fail_test)
  # Add test that will fail
  set_tests_properties(memory_sanitizer_fail_test PROPERTIES WILL_FAIL TRUE)
endif(${CMAKE_BUILD_TYPE} STREQUAL "MemorySanitizer")
