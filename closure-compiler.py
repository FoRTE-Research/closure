#!/usr/bin/python

import subprocess
import sys


def create_compilation_command():

    cxxflags = [" -I../../instrumentation/tools/src", "-Xclang",  "-load" ,"-Xclang", "../../build/libclosure.so"]
    args = sys.argv[1:]

    command = ["clang"] + cxxflags
    command += args

    if "-c" not in args:
        command += [" stubMain.c"]

    ret = ""
    for i in command:
        ret += i + " "

    return ret


def perform_compilation():
    command = create_compilation_command()
    print(command)

    code = subprocess.call(command, shell=True)
    if (code != 0):
        print(" FAILED!! ")



for i in sys.argv[1:]:
    print (i + "\n")

perform_compilation()