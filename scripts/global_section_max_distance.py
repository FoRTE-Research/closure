#!/usr/bin/python

import sys

if (len(sys.argv) < 2):
    print("Usage: ./global_section_max_distance.py <global_bitmap>")
    exit(1)

fname = sys.argv[1]
f = open(fname, mode="r")

max_distance = 0

global_bytes = f.read()

idx = 0
last_seen_idx = -1
for global_byte in global_bytes:
    if global_byte == '\x01':
        if last_seen_idx != -1:
            max_distance = idx - last_seen_idx
        last_seen_idx = idx
    idx += 1


print("Max distance between two bytes for the bitmap is : {}".format(max_distance))