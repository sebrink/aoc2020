# DayTemplate Advent of Code 2020
import strutils, sequtils

# Solve part one
proc partOne(file: seq[int]): int =
    return

# Solve part two
proc partTwo(file: seq[int]): int =
    return
    
# Read in input file and converts everything to numbers
let input = readFile("input.txt").strip().splitLines().map(parseInt)
echo input.partOne
echo input.partTwo