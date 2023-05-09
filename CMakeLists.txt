project(closure)

cmake_minimum_required(VERSION 3.1)

# support C++14 features used by LLVM 10.0.0
set(CMAKE_CXX_STANDARD 14)

find_package(LLVM 10 REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

include_directories(./include)

add_library(closure MODULE
    ./src/Common.cpp
    ./src/Pass.cpp
    ./src/RenameMainPass.cpp
    ./src/HeapPass.cpp
    ./src/ExitPass.cpp
    ./src/GlobalPass.cpp
    ./src/StubPass.cpp
    ./src/FilePass.cpp
)

set_target_properties(closure PROPERTIES
    COMPILE_FLAGS "-fno-rtti -fPIC -g"
)
