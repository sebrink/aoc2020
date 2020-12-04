# Day02 Advent of Code 2020
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

# Parse part two
proc partTwo(file: seq[string]): int =
    for i in file:
        # Parsing and defining variables
        let line = i.split({' '})
        let required = parseInt(line[0].split({'-'})[0])-1   # -1 to account for no concept of index zero 
        let disallowed = parseInt(line[0].split({'-'})[1])-1 # -1 to account for no concept of index zero
        let letter = line[1][0]
        let password = line[2]
        # Parse check and add to the return result
        if password[required] == letter and password[disallowed] != letter:
            result += 1
        elif password[required] != letter and password[disallowed] == letter:
            result += 1

# Read in input file and converts everything to numbers
let input = readFile("input.txt").splitlines()
echo input.partOne
echo input.partTwo