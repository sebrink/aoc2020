# Day03 Advent of Code 2020
import strutils

# Solve part one
proc partOne(file: seq[string]): int =
    var x,y: int
    let inputLength = file.len-2
    let lineLength = file[1].len
    while x <= inputLength:
        inc(x,1)
        inc(y,3)
        if y >= lineLength:
            y = y mod lineLength
        if file[x][y] == '#':
            inc(result)

# Made generic puzzle solver for usage in part 2
proc genericPuzzleSolver(file: seq[string], xSlope,ySlope: int): int =
    var x,y: int
    let inputLength = file.len-2
    let lineLength = file[1].len
    while x <= inputLength:
        inc(x,xSlope)
        inc(y,ySlope)
        if y >= lineLength:
            y = y mod lineLength
        if file[x][y] == '#':
            inc(result)

# Solve part two
proc partTwo(file: seq[string]): int =
    let slope1 = genericPuzzleSolver(file,1,1)
    let slope2 = genericPuzzleSolver(file,1,3)
    let slope3 = genericPuzzleSolver(file,1,5)
    let slope4 = genericPuzzleSolver(file,1,7)
    let slope5 = genericPuzzleSolver(file,2,1)
    result = slope1*slope2*slope3*slope4*slope5

# Read in input file and converts everything to numbers
let input = readFile("input.txt").splitLines()
echo input.partOne
echo input.partTwo
