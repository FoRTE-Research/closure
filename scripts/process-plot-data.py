#!/usr/bin/python3

import argparse
import os
import pandas


# These are the fields in the plot data file
class PLOT_FIELDS:
    relative_time = 0
    cycles_done = 1
    cur_item = 2
    corpus_count = 3
    pending_total = 4
    pending_favs = 5
    map_size = 6
    saved_crashes = 7
    saved_hangs = 8
    max_depth = 9
    execs_per_sec = 10
    total_execs = 11
    edges_found = 12


def parse_plot_data(plot_fname: str):

    df = pandas.read_csv(filepath_or_buffer=plot_fname, index_col=False)

    return df


def print_crash_times(plot_dataframe: pandas.DataFrame):

    num_crashes = 0

    for plot_row in plot_dataframe.iterrows():
        if plot_row[1][PLOT_FIELDS.saved_crashes] == num_crashes:
            continue
        # Found a crash now!
        while num_crashes != plot_row[1][PLOT_FIELDS.saved_crashes]:
            num_crashes += 1
            rel_time = plot_row[1][PLOT_FIELDS.relative_time]
            crash_string = "id" + str(num_crashes - 1).zfill(6)
            print(f"Crash ID: {crash_string}\t  Discovery Time: {rel_time}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', dest="plot_file", required=True)
    parser.add_argument('-x', dest="process_crash_time",
                        action="store_true", required=False)

    args = parser.parse_args()

    plot_dataframe = parse_plot_data(plot_fname=args.plot_file)
    if args.process_crash_time:
        print_crash_times(plot_dataframe=plot_dataframe)


if __name__ == '__main__':
    main()
