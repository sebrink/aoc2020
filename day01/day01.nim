# Day01 Advent of Code 2020

import strutils, sequtils

proc partOne(file: seq[int]): int =
    for i in file:
        for j in file:
            if i+j == 2020:
                result += i*j
                return

proc partTwo(file: seq[int]): int =
    for i in file:
        for j in file:
            for k in file:
                if i+j+k == 2020:
                    result += i*j*k
                    return
    
# Read in input file and converts everything to numbers
let input = readFile("input.txt").strip().splitLines().map(parseInt)
echo input.partOne
echo input.partTwo