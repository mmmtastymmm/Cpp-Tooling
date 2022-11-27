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

# ThreadSanitizer
set(CMAKE_CXX_FLAGS_THREADSANITIZER
    "-fsanitize=thread -O2 -g"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_THREADSANITIZER
    "-fsanitize=thread -O2 -g"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_THREADSANITIZER CMAKE_C_FLAGS_THREADSANITIZER)

# UndefinedBehaviorSanitizer
set(CMAKE_CXX_FLAGS_UNDEFINEDBEHAVIORSANITIZER
    "-fsanitize=undefined -O0 -g"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_UNDEFINEDBEHAVIORSANITIZER
    "-fsanitize=undefined -O0 -g"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_UNDEFINEDBEHAVIORSANITIZER
                 CMAKE_C_FLAGS_UNDEFINEDBEHAVIORSANITIZER)

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

# Set all the build types supported here
set(ACCEPTABLE_BUILD_TYPES
    "Debug;Release;Coverage;RelWithDebInfo;MinSizeRel;AddressSanitizer;LeakSanitizer;ThreadSanitizer;UndefinedBehaviorSanitizer;MemorySanitizer"
)
# Make sure the user has chosen a correct build type, otherwise stop generation
# and ask them to choose one
list(FIND ACCEPTABLE_BUILD_TYPES ${CMAKE_BUILD_TYPE} BUILD_TYPE_INDEX)
# If the build type wasn't in the list it return index -1
if(BUILD_TYPE_INDEX EQUAL -1)
  list(JOIN ACCEPTABLE_BUILD_TYPES " " PRETTY_BUILD_TYPES)
  message(
    FATAL_ERROR
      "Please specify one of the follow build types (-D CMAKE_BUILD_TYPE=<type>): ${PRETTY_BUILD_TYPES}"
  )
endif(BUILD_TYPE_INDEX EQUAL -1)
if(CMAKE_BUILD_TYPE IN_LIST ACCEPTABLE_CMAKE_BUILD_TYPES)
  list(JOIN ACCEPTABLE_BUILD_TYPES " " PRETTY_BUILD_TYPES)
  message(
    FATAL_ERROR
      "Please specify one of the follow build types (-D CMAKE_BUILD_TYPE=<type>): ${PRETTY_BUILD_TYPES}"
  )
endif(CMAKE_BUILD_TYPE IN_LIST ACCEPTABLE_CMAKE_BUILD_TYPES)
# Message the build type so it is included in output logs
message(STATUS "Current build type is: ${CMAKE_BUILD_TYPE}")

# Include some optional targets that ensure the sanitizers are functional
include(${CMAKE_CURRENT_LIST_DIR}/Sanitizers_Working.cmake)
