#!/usr/bin/python3

import sys
import os
import subprocess
import argparse
import matplotlib.pyplot as plt
import numpy
import random
import pandas as pd

COVERAGE_DUMP_FILE = "COVERAGE_DUMP_FILE"
COVERAGE_FILE_PATH = os.path.join(os.getcwd(), "coverage")

plot = False


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def process_coverage_dump_file(fname):

    f = open(fname, mode="r")

    unique_edges = set()
    total_edges = list()

    coverage_dump = f.read()
    f.close()

    coverage_dump = coverage_dump.split(",")
    for edge in coverage_dump:
        if edge == '':
            continue
        edge = int(edge, 10)
        unique_edges.add(edge)
        total_edges.append(edge)
    return (unique_edges, total_edges)


def get_timestamp(fname):
    fname = fname.split(",")

    for i in fname:
        if "time:" in i:
            return int(i.strip("time:"), 10)
    return -1


def get_queue_id(fname):
    fname = fname.split(",")
    for i in fname:
        if "id:" in i:
            return i.strip("id:")
    return -1


def process_queue_dir(corpus_dir, cmdline, cache_dir=None, result_csv=None):
    global COVERAGE_FILE_PATH, COVERAGE_DUMP_FILE

    env = os.environ.copy()
    env[COVERAGE_DUMP_FILE] = COVERAGE_FILE_PATH
    corpus = os.listdir(corpus_dir)
    corpus = sorted(corpus)
    inputs_processed = 0
    unique_edge_count_list = list()
    unique_edge_set = set()
    time_entry_list = list()

    for f in corpus:
        fname = os.path.join(corpus_dir, f)
        if os.path.isfile(fname) is False:
            continue
        inputs_processed += 1
        print(f"Processed {inputs_processed}")
        command: str = cmdline

        i = 0

        if "@@" in command:
            command = command.replace("@@", fname)
        i += 1
        if (cache_dir) is None:
            run = subprocess.run(
                command, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)
        else:
            COVERAGE_FILE_PATH = os.path.join(
                cache_dir, "coverage" + str(get_queue_id(f)))
            if os.path.exists(COVERAGE_FILE_PATH) == False:
                env[COVERAGE_DUMP_FILE] = COVERAGE_FILE_PATH
                run = subprocess.run(
                    command, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)

        if os.path.exists(COVERAGE_FILE_PATH):
            unique_edges, total_edges = process_coverage_dump_file(
                COVERAGE_FILE_PATH)
            unique_edge_set = unique_edge_set.union(unique_edges)
            unique_edge_count_list.append(len(unique_edge_set))
            if cache_dir is None:
                os.unlink(COVERAGE_FILE_PATH)

            time_entry_list.append((int)(get_timestamp(f) / 1000))

        else:
            print(f"Input {fname} did not generate a coverage file!\n")
    if "afl" in cache_dir:
        fname = "results_afl.csv"
    else:
        fname = "results_closure.csv"

    if result_csv is not None:
        fname = result_csv
    make_csv(time_entry_list, unique_edge_count_list, fname)
    if plot:
        plot_graph(time_entry_list, unique_edge_count_list)


def plot_graph(X, Y):
    xpts = numpy.array(X)
    ypts = numpy.array(Y)
    plt.plot(xpts, ypts, color='b')
    plt.show()


def make_csv(X, Y, fname):
    rows = [row for row in zip(X, Y)]
    columns = ["Time", "Unique edge count"]
    df = pd.DataFrame(rows, columns=columns)
    df.reset_index()
    print(df)
    df.to_csv(fname)


def plot_csv():
    df = pd.read_csv("results.csv")
    Y = df["Unique edge count"].tolist()
    X = df["Time"].tolist()
    plot_graph(X, Y)


def main():

    parser = argparse.ArgumentParser(
        prog="edge-coverage.py",
        description="Script to calculate edge-coverage of a program for one(or more) input"
    )
    parser.add_argument(
        "-d",
        dest="corpus_dirs",
        required=False,
        action='append',
        help="Full path to the corpus directory"
    )
    parser.add_argument("-r", dest="result_csvs", required=False,
                        action='append', help="destination file for processed csv")
    parser.add_argument("--cmdline", dest="cmdline", required=True)
    parser.add_argument("-cache-dir", dest="cache_dir", required=False,
                        action='append', help="Cache dir storing/to store generated edge coverage")
    parser.add_argument("-plot", dest="plot", required=False,
                        action='store_true', help="Plot graph interactively")

    global plot

    IS_SINGLE_INPUT = False
    args = parser.parse_args()

    if args.plot is True:
        plot = True

    if args.corpus_dirs is None:
        IS_SINGLE_INPUT = True

    global COVERAGE_FILE_PATH, COVERAGE_DUMP_FILE

    env = os.environ.copy()
    env[COVERAGE_DUMP_FILE] = COVERAGE_FILE_PATH

    if IS_SINGLE_INPUT:
        command = args.cmdline
        run = subprocess.run(
            command,  capture_output=False, text=False, env=env)

        if os.path.exists(COVERAGE_FILE_PATH):
            unique_edges, total_edges = process_coverage_dump_file(
                COVERAGE_FILE_PATH)
            print(f"Number of unique edges = {len(unique_edges)}")
            print(f"Number of total edges = {len(total_edges)}")
            os.unlink(COVERAGE_FILE_PATH)
        else:
            print(
                f"{bcolors.WARNING} No Coverage Dump File generated. Is it compiled with trace-pc-guard? {bcolors.ENDC}")

        exit(0)

    if "@@" not in args.cmdline:
        print("Usage: Requires @@ in cmdline with -d option")
        exit(1)
    print(f"ARGS: {args.cache_dir} , {args.corpus_dirs}")
    for cache_dir, corpus_dir, result_csv in zip(args.cache_dir, args.corpus_dirs, args.result_csvs):
        print(f"CORPUS DIR TO PROCESS: {corpus_dir}")
        corpus_dir = os.path.abspath(corpus_dir)
        process_queue_dir(corpus_dir, args.cmdline, cache_dir, result_csv)


if __name__ == "__main__":
    main()
