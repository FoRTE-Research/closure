project(correctness-compiler)

cmake_minimum_required(VERSION 3.1)

# support C++14 features used by LLVM 10.0.0
set(CMAKE_CXX_STANDARD 14)

add_executable(correctness-compiler
    ./correctness.cc
)
set_target_properties(closure-compiler PROPERTIES
    COMPILE_FLAGS "-g -Wno-unused-value"
)
