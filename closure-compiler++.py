#!/usr/bin/python3

import subprocess
import sys
import os

AFL_PATH = "/home/jack/projects/AFLplusplus/"
AFL_CLANG_FAST = os.path.join(AFL_PATH, "afl-clang-fast++")

CLOSURE_PATH = "/home/jack/projects/closure"
CLOSURE_STUB = os.path.join(CLOSURE_PATH, "instrumentation/tools/src/stubMain.c")
CLOSURE_PASS = os.path.join(CLOSURE_PATH, "build/libclosure.so")

CLOSURE_FLAGS = ["-Xclang", "-load", "-Xclang", CLOSURE_PASS]

CLOSURE_STUB_REQUIRED_STRING = "undefined reference to `main'"


def create_compilation_command():

    compile_command = False
    for i in sys.argv:
        if (".c" in i or  ".o" in i):
            compile_command = True
    argv = sys.argv
    if not compile_command:
        i = 0
        for arg in argv:
            if "closure-compiler++.py" in arg:
                argv[i] = AFL_CLANG_FAST
            i += 1
        return argv

    i = 0
    for arg in argv:
        if "closure-compiler.py" in arg:
            argv[i] = AFL_CLANG_FAST
        i += 1
    argv += CLOSURE_FLAGS
    return argv



def perform_compilation():
    command = create_compilation_command()
    run = subprocess.run(command,  capture_output=True, text=True)
    
    if (CLOSURE_STUB_REQUIRED_STRING in run.stderr):
        command += [CLOSURE_STUB]
        run = subprocess.run(command,  capture_output=True, text=True)
    print(run.stdout)


perform_compilation()