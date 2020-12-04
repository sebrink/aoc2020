# Day01 Advent of Code 2020
import strutils

# Parse part one
proc partOne(file: seq[string]): int =
    for i in file:
        # Parsing and defining variables
        let line = i.split({' '})
        let min = parseInt(line[0].split({'-'})[0])
        let max = parseInt(line[0].split({'-'})[1])
        let letter = line[1][0]
        let password = line[2]
        let count = count(password, letter)
        # Parse check and add to the return result
        if count <= max and count >= min:
            result += 1

# Read in input file and converts everything to numbers
let input = readFile("input.txt").splitlines()
echo input.partOne