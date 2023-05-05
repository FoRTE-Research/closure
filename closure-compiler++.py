#!/usr/bin/python3

import subprocess
import sys
import os

AFL_PATH = os.path.join(os.path.expanduser('~'), "projects/AFLplusplus/")
AFL_CLANG_FAST = os.path.join(AFL_PATH, "afl-clang-fast++")
DEFAULT_COMPILER = "clang++"


CLOSURE_PATH = os.path.join(os.path.expanduser('~'), "projects/closure/")
CLOSURE_STUB = os.path.join(CLOSURE_PATH, "instrumentation/tools/src/stubMain.c")
CLOSURE_STUB_AFL = os.path.join(CLOSURE_PATH, "instrumentation/tools/src/stubMainAFL.c")
CLOSURE_PASS = os.path.join(CLOSURE_PATH, "build/libclosure.so")

CLOSURE_FLAGS = ["-Xclang", "-load", "-Xclang"]

CLOSURE_STUB_REQUIRED_STRING = "undefined reference to `main'"


def create_compilation_command():

    compile_command = False
    for i in sys.argv:
        if (".c" in i or  ".o" in i):
            compile_command = True
    argv = sys.argv

    i = 0

    if "-no-fuzz" in argv:
        CLOSURE_FLAGS.append(CLOSURE_STUB)
        COMPILER = DEFAULT_COMPILER
        argv.remove("-no-fuzz")
    else:
        CLOSURE_FLAGS.append(CLOSURE_STUB_AFL)
        COMPILER = AFL_CLANG_FAST

    for arg in argv:
        if "closure-compiler.py" in arg:
            argv[i] = COMPILER
        i += 1
    
    if not compile_command:
        return argv

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