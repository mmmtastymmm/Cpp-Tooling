# Add new build types Coverage
message(STATUS "Adding sanitizer build types")
set(CMAKE_CXX_FLAGS_COVERAGE
    "${GCC_DEBUG_FLAGS} -fprofile-arcs -ftest-coverage"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_COVERAGE
    "${GCC_DEBUG_FLAGS} -fprofile-arcs -ftest-coverage"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_COVERAGE CMAKE_C_FLAGS_COVERAGE)

# Address Sanitizer
set(CMAKE_CXX_FLAGS_ADDRESSSANITIZER
    "-fsanitize=address -O1 -g -fno-omit-frame-pointer"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_ADDRESSSANITIZER
    "-fsanitize=address -O1 -g -fno-omit-frame-pointer"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_ADDRESSSANITIZER
                 CMAKE_C_FLAGS_ADDRESSSANITIZER)

# Leak Sanitizer
set(CMAKE_CXX_FLAGS_LEAKSANITIZER
    "-fsanitize=leak"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_LEAKSANITIZER
    "-fsanitize=leak"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_LEAKSANITIZER CMAKE_C_FLAGS_LEAKSANITIZER)

# MemorySanitizer
set(CMAKE_CXX_FLAGS_MEMORYSANITIZER
    "-fsanitize-memory-track-origins -fsanitize=memory -fPIE -fno-omit-frame-pointer -g -fno-optimize-sibling-calls -O1 -fsanitize-ignorelist=${CMAKE_CURRENT_LIST_DIR}/../memory_ignore_list.txt"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_MEMORYSANITIZER
    "-fsanitize-memory-track-origins -fsanitize=memory -fPIE -fno-omit-frame-pointer -g -fno-optimize-sibling-calls -O1 -fsanitize-ignorelist=${CMAKE_CURRENT_LIST_DIR}/../memory_ignore_list.txt"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
set(LINK_FLAGS_MEMORYSANITIZER "-fsanitize=memory")
mark_as_advanced(CMAKE_CXX_FLAGS_MEMORYSANITIZER CMAKE_C_FLAGS_MEMORYSANITIZER
                 LINK_FLAGS_MEMORYSANITIZER)

# ThreadSanitizer
set(CMAKE_CXX_FLAGS_THREADSANITIZER
    "-fsanitize=thread -O2 -g"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_THREADSANITIZER
    "-fsanitize=thread -O2 -g"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_THREADSANITIZER CMAKE_C_FLAGS_THREADSANITIZER)

# UndefinedBehaviorSanitizer

# Note: This is aggressive and the program exits on the first undefined
# behavior.
set(CMAKE_CXX_FLAGS_UNDEFINEDBEHAVIORSANITIZER
    "-fsanitize=undefined -fno-sanitize-recover=undefined -O0 -g"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_UNDEFINEDBEHAVIORSANITIZER
    "-fsanitize=undefined -fno-sanitize-recover=undefined -O0 -g"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_UNDEFINEDBEHAVIORSANITIZER
                 CMAKE_C_FLAGS_UNDEFINEDBEHAVIORSANITIZER)

# Set all the build types supported here
set(ACCEPTABLE_BUILD_TYPES
    "Debug;Release;Coverage;RelWithDebInfo;MinSizeRel;AddressSanitizer;LeakSanitizer;ThreadSanitizer;UndefinedBehaviorSanitizer;MemorySanitizer"
)
list(JOIN ACCEPTABLE_BUILD_TYPES " " PRETTY_BUILD_TYPES)
# Ensure the user has specified a build type

# Ensure a cmake build type is present
if(NOT CMAKE_BUILD_TYPE)
  message(
    FATAL_ERROR
      "Please specify one of the follow build types (-D CMAKE_BUILD_TYPE=<type>): ${PRETTY_BUILD_TYPES}"
  )
endif()
# Make sure the user has chosen a correct build type, otherwise stop generation
# and ask them to choose one
list(FIND ACCEPTABLE_BUILD_TYPES ${CMAKE_BUILD_TYPE} BUILD_TYPE_INDEX)

# If the build type wasn't in the list it return index -1
if(${CMAKE_BUILD_TYPE} EQUAL "" OR ${BUILD_TYPE_INDEX} EQUAL -1)
  message(
    FATAL_ERROR
      "An incorrect build type was specified. Please specify one of the follow build types (-D CMAKE_BUILD_TYPE=<type>): ${PRETTY_BUILD_TYPES}"
  )
endif()
# Message the build type so it is included in output logs
message(STATUS "Current build type is: ${CMAKE_BUILD_TYPE}")

# Include some optional targets that ensure the sanitizers are functional
include(${CMAKE_CURRENT_LIST_DIR}/Sanitizers_Working.cmake)
