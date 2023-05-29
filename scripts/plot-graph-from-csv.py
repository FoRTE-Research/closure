#!/usr/bin/python3


import argparse
import matplotlib.pyplot as plt
import numpy
import pandas as pd
import math

label_x = "log10(Time (in seconds))"
label_y = "Number of Unique edges"

dashes = ["-", "--", "-.", ":"]
colors = ['C0', 'C1', 'C2']
def init_plotting(fig_width = 8, font=20):
    golden_mean = (math.sqrt(5)-1.0)/2.0    # Aesthetic ratio
    fig_height = golden_mean * fig_width

    plt.rcParams['figure.figsize'] =[fig_width,fig_height]
    plt.rcParams['font.size'] = font
    # plt.rcParams['font.family'] = 'Times New Roman'
    plt.rcParams['axes.labelsize'] = plt.rcParams['font.size']
    plt.rcParams['axes.titlesize'] = 1.5*plt.rcParams['font.size']
    plt.rcParams['legend.fontsize'] = plt.rcParams['font.size']
    plt.rcParams['xtick.labelsize'] = plt.rcParams['font.size']
    plt.rcParams['ytick.labelsize'] = plt.rcParams['font.size']

    plt.rcParams['legend.frameon'] = False
    plt.rcParams['legend.loc'] = 'upper center'
    plt.rcParams['axes.linewidth'] = 1
    plt.legend(loc='best', fancybox=True)

    plt.gca().xaxis.set_ticks_position('bottom')
    plt.gca().yaxis.set_ticks_position('left')

def plot_csv(fname, color, label, dash=dashes[0]):
    df = pd.read_csv(fname)
    Y = df["Unique edge count"].tolist()
    X = df["Time"].tolist()
    xpts = numpy.array(X)
    xpts = [numpy.log10(x) for x in xpts]
    ypts = numpy.array(Y)
    plt.plot(xpts, ypts, color=color, linestyle=dash, label=label)

def main():
    parser = argparse.ArgumentParser(
        prog="edge-coverage.py",
        description="Script to calculate edge-coverage of a program for one(or more) input"
    )
    parser.add_argument("-afl", dest="afl_csv", required = False)
    parser.add_argument("-closure", dest="closure_csv", required=False)
    parser.add_argument("-title", dest="plot_title", required=True)

    args = parser.parse_args()

    init_plotting(font=12)
    if args.afl_csv:
        plot_csv(args.afl_csv, colors[0], "AFL")
    if args.closure_csv:
        plot_csv(args.closure_csv, colors[1], "Closure")
    plt.legend(loc="lower right")
    plt.xticks([0, 1, 2, 3, 4], [1, 10, 100, 1000, 10000])
    plt.xlabel(label_x)
    plt.ylabel(label_y)
    plt.title(args.plot_title)
    plt.show()


if __name__ == "__main__":
    main()