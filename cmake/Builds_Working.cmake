# Ensure the sanitizers are catching simple test
if(${CMAKE_BUILD_TYPE} STREQUAL "AddressSanitizer")
  message(STATUS "Adding address sanitizer tests for ${CMAKE_PROJECT_NAME}")
  # Add one executable target for the unit tests
  add_executable(address_sanitizer_basic_test
                 ../test/test_build_working/test_address_sanitizer.cpp)
  # Add a test for ctest
  add_test(NAME "address_sanitizer_basic_test"
           COMMAND address_sanitizer_basic_test)
  # This should fail if the memory sanitizer is working correctly
  set_tests_properties(address_sanitizer_basic_test
                       PROPERTIES WILL_FAIL TRUE LABELS "Build_Working")
endif(${CMAKE_BUILD_TYPE} STREQUAL "AddressSanitizer")

# Ensure the sanitizers are catching simple test
if(${CMAKE_BUILD_TYPE} STREQUAL "Hardened")
  message(STATUS "Adding hardened tests for ${CMAKE_PROJECT_NAME}")
  # Add one executable target for the unit tests
  add_executable(hardened_stack_smash_test
                 ../test/test_build_working/test_stack_smash.cpp)
  # Add a test for ctest
  add_test(NAME "hardened_stack_smash_test" COMMAND hardened_stack_smash_test)
  # This should fail if the memory sanitizer is working correctly
  set_tests_properties(hardened_stack_smash_test
                       PROPERTIES WILL_FAIL TRUE LABELS "Build_Working")
endif(${CMAKE_BUILD_TYPE} STREQUAL "Hardened")

# Ensure the sanitizers are catching simple test
if(${CMAKE_BUILD_TYPE} STREQUAL "LeakSanitizer")
  message(STATUS "Adding leak sanitizer tests for ${CMAKE_PROJECT_NAME}")
  # Add one executable target for the unit tests
  add_executable(leak_sanitizer_basic_test
                 ../test/test_build_working/test_leak_sanitizer.cpp)
  # Add a test for ctest
  add_test(NAME "leak_sanitizer_basic_test" COMMAND leak_sanitizer_basic_test)
  # This should fail if the memory sanitizer is working correctly
  set_tests_properties(leak_sanitizer_basic_test
                       PROPERTIES WILL_FAIL TRUE LABELS "Build_Working")
endif(${CMAKE_BUILD_TYPE} STREQUAL "LeakSanitizer")

# Ensure the sanitizers are catching simple test
if(${CMAKE_BUILD_TYPE} STREQUAL "MemorySanitizer")
  message(STATUS "Adding memory sanitizer tests for ${CMAKE_PROJECT_NAME}")
  # Add one executable target for the unit tests
  add_executable(memory_sanitizer_basic_test
                 ../test/test_build_working/test_memory_sanitizer.cpp)
  # Add a test for ctest
  add_test(NAME "memory_sanitizer_basic_test"
           COMMAND memory_sanitizer_basic_test)
  # This should fail if the memory sanitizer is working correctly
  set_tests_properties(memory_sanitizer_basic_test
                       PROPERTIES WILL_FAIL TRUE LABELS "Build_Working")
endif(${CMAKE_BUILD_TYPE} STREQUAL "MemorySanitizer")

# Ensure the sanitizers are catching simple test
if(${CMAKE_BUILD_TYPE} STREQUAL "ThreadSanitizer")
  message(STATUS "Adding thread sanitizer tests for ${CMAKE_PROJECT_NAME}")
  # Add one executable target for the unit tests
  add_executable(thread_sanitizer_basic_test
                 ../test/test_build_working/test_thread_sanitizer.cpp)
  # Add a test for ctest
  add_test(NAME "thread_sanitizer_basic_test"
           COMMAND thread_sanitizer_basic_test)
  # This should fail if the memory sanitizer is working correctly
  set_tests_properties(thread_sanitizer_basic_test
                       PROPERTIES WILL_FAIL TRUE LABELS "Build_Working")
endif(${CMAKE_BUILD_TYPE} STREQUAL "ThreadSanitizer")

# Ensure the sanitizers are catching simple test this is different since the
# default behavior is to continue and just print errors
if(${CMAKE_BUILD_TYPE} STREQUAL "UndefinedBehaviorSanitizer")
  message(
    STATUS "Adding undefined behavior sanitizer tests for ${CMAKE_PROJECT_NAME}"
  )
  # Add one executable target for the unit tests
  add_executable(
    undefined_behavior_sanitizer_basic_test
    ../test/test_build_working/test_undefined_behavior_sanitizer.cpp)
  # Add a test for ctest
  add_test(NAME "undefined_behavior_sanitizer_basic_test"
           COMMAND undefined_behavior_sanitizer_basic_test)
  # This should fail if the memory sanitizer is working correctly
  set_tests_properties(undefined_behavior_sanitizer_basic_test
                       PROPERTIES WILL_FAIL TRUE LABELS "Build_Working")
endif(${CMAKE_BUILD_TYPE} STREQUAL "UndefinedBehaviorSanitizer")
