#!/usr/bin/python3

import sys
import os
import subprocess
import argparse


CLOSURE_GLOBAL_SECTION_ADDR = "CLOSURE_GLOBAL_SECTION_ADDR"
CLOSURE_GLOBAL_SECTION_SIZE = "CLOSURE_GLOBAL_SECTION_SIZE"
CLOSURE_GLOBAL_BITMAP_FILE = "CLOSURE_GLOBAL_BITMAP_FILE"

BITMAP_FILE_PATH = os.path.join(os.getcwd(), "global_bitmap")


def process_global_bitmap_file(fname):

    f = open(fname, mode="r")

    max_distance = 0
    num_modified_bytes = 0

    global_bytes = f.read()

    idx = 0
    last_seen_idx = -1
    for global_byte in global_bytes:
        if global_byte != '\x00':
            num_modified_bytes += 1
            if last_seen_idx != -1:
                max_distance = idx - last_seen_idx
            last_seen_idx = idx
        idx += 1

    return (num_modified_bytes, max_distance)


def main():
    parser = argparse.ArgumentParser(
        prog="global-overhead.py",
        description="Script to calculate global overhead of a program for one(or more) input"
    )
    parser.add_argument("-g", dest="target_global_section_size", required=True)
    parser.add_argument(
        "--addr", dest="target_global_section_addr", required=True)
    parser.add_argument("-d", dest="corpus_dir", required=False)
    parser.add_argument("--cmdline", dest="cmdline", required=True, nargs="+")

    IS_SINGLE_INPUT = False
    args = parser.parse_args()

    if args.corpus_dir is None:
        IS_SINGLE_INPUT = True

    env = os.environ.copy()
    env[CLOSURE_GLOBAL_SECTION_ADDR] = args.target_global_section_addr
    env[CLOSURE_GLOBAL_SECTION_SIZE] = args.target_global_section_size
    env[CLOSURE_GLOBAL_BITMAP_FILE] = BITMAP_FILE_PATH

    if IS_SINGLE_INPUT:
        command = args.cmdline
        run = subprocess.run(command,  capture_output=True, text=True, env=env)

        if os.path.exists(BITMAP_FILE_PATH):
            num_bytes_modified, max_distance = process_global_bitmap_file(
                BITMAP_FILE_PATH)
            print(f"Global section size {args.target_global_section_size}")
            print(
                f"Number of global section bytes modified {num_bytes_modified}")
            os.unlink(BITMAP_FILE_PATH)

    else:
        max_num_bytes_modified = -1
        num_bytes_modified_list = list()
        if "@@" not in args.cmdline:
            print("Usage: Requires @@ in cmdline with -d option")
            exit(1)
        corpus_dir = os.path.abspath(args.corpus_dir)

        for f in os.listdir(corpus_dir):
            fname = os.path.join(corpus_dir, f)
            if os.path.isfile(fname):
                command: list = args.cmdline.copy()

                i = 0
                for arg in command:
                    if "@@" in arg:
                        command[i] = fname
                    i += 1

                run = subprocess.run(
                    command,  capture_output=True, text=True, env=env)

                if os.path.exists(BITMAP_FILE_PATH):
                    num_bytes_modified, max_distance = process_global_bitmap_file(
                        BITMAP_FILE_PATH)
                    max_num_bytes_modified = num_bytes_modified if (
                        num_bytes_modified > max_num_bytes_modified) else max_num_bytes_modified
                    num_bytes_modified_list.append(num_bytes_modified)
                    os.unlink(BITMAP_FILE_PATH)
                else:
                    print(f"Input {fname} did not generate a bitmap file!\n")

        print(f"Global Section size {args.target_global_section_size}")
        print(
            f"Max number of Global modified bytes is {max_num_bytes_modified}\n")
        print(
            f"Average number of bytes modified is { int(sum(num_bytes_modified_list)/len(num_bytes_modified_list))}")


if __name__ == "__main__":
    main()
