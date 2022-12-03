# Ensure the sanitizers are catching simple test
if(${CMAKE_BUILD_TYPE} STREQUAL "MemorySanitizer")
  message(STATUS "Adding memory sanitizer tests for ${CMAKE_PROJECT_NAME}")
  # Add one executable target for the unit tests
  add_executable(memory_sanitizer_basic_test
                 ../test/test_sanitizers_working/test_memory_sanitizer.cpp)
  # Add a test for ctest
  add_test(NAME "memory_sanitizer_basic_test"
           COMMAND memory_sanitizer_basic_test)
  # This should fail if the memory sanitizer is working correctly
  set_tests_properties(memory_sanitizer_basic_test
                       PROPERTIES WILL_FAIL TRUE LABELS "Sanitizer_Working")
endif(${CMAKE_BUILD_TYPE} STREQUAL "MemorySanitizer")
