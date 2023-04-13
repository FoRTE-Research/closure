project(closure)

cmake_minimum_required(VERSION 3.1)

# support C++14 features used by LLVM 10.0.0
set(CMAKE_CXX_STANDARD 14)

find_package(LLVM 10 REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_subdirectory(global-pass)
add_subdirectory(main-pass)
add_subdirectory(heap-pass)
add_subdirectory(stub-pass)