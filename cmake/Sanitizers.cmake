# Add new build types
## Coverage
message(STATUS "Adding build types...")
set(CMAKE_CXX_FLAGS_COVERAGE
    "${GCC_DEBUG_FLAGS} -fprofile-arcs -ftest-coverage"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_COVERAGE
    "${GCC_DEBUG_FLAGS} -fprofile-arcs -ftest-coverage"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_COVERAGE CMAKE_C_FLAGS_COVERAGE)

## Address Sanitizer
set(CMAKE_CXX_FLAGS_ADDRESSSANITIZER
    "-fsanitize=address -O1 -g -fno-omit-frame-pointer"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_ADDRESSSANITIZER
    "-fsanitize=address -O1 -g -fno-omit-frame-pointer"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_ADDRESSSANITIZER
                 CMAKE_C_FLAGS_ADDRESSSANITIZER)

## Leak Sanitizer
set(CMAKE_CXX_FLAGS_LEAKSANITIZER
    "-fsanitize=leak"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_LEAKSANITIZER
    "-fsanitize=leak"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_LEAKSANITIZER
                 CMAKE_C_FLAGS_LEAKSANITIZER)

## ThreadSanitizer
set(CMAKE_CXX_FLAGS_THREADSANITIZER
    "-fsanitize=thread -O2 -g"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_THREADSANITIZER
    "-fsanitize=thread -O2 -g"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_THREADSANITIZER
                 CMAKE_C_FLAGS_THREADSANITIZER)

## UndefinedBehaviorSanitizer
set(CMAKE_CXX_FLAGS_UNDEFINEDBEHAVIORSANITIZER
    "-fsanitize=undefined -O0 -g"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_UNDEFINEDBEHAVIORSANITIZER
    "-fsanitize=undefined -O0 -g"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_UNDEFINEDBEHAVIORSANITIZER
                 CMAKE_C_FLAGS_UNDEFINEDBEHAVIORSANITIZER)

## MemorySanitizer
set(CMAKE_CXX_FLAGS_MEMORYSANITIZER
    "-fsanitize-memory-track-origins -fsanitize=memory -fPIE -pie -fno-omit-frame-pointer -g"
    CACHE STRING "Flags used by the C++ compiler during coverage builds." FORCE)
set(CMAKE_C_FLAGS_MEMORYSANITIZER
    "-fsanitize-memory-track-origins -fsanitize=memory -fPIE -pie -fno-omit-frame-pointer -g"
    CACHE STRING "Flags used by the C compiler during coverage builds." FORCE)
mark_as_advanced(CMAKE_CXX_FLAGS_MEMORYSANITIZER
                 CMAKE_C_FLAGS_MEMORYSANITIZER)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE
      Debug
      CACHE
        STRING
        "Please specify one of the follow build types: Debug Release Coverage RelWithDebInfo MinSizeRel AddressSanitizer LeakSanitizer ThreadSanitizer UndefinedBehaviorSanitizer MemorySanitizer"
        FORCE)
endif(NOT CMAKE_BUILD_TYPE)
message(STATUS "Current build type is : ${CMAKE_BUILD_TYPE}")
