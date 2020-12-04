# Day04 Advent of Code 2020
import strutils, sequtils

# Solve part one
proc partOne(file: seq[string]): int =
    let fileLength = file.len()
    var byr,iyr,eyr,hgt,hcl,ecl,pid = false
    var trueCount,count: int
    while count <= fileLength-1:
        # The section after the or handles a really weird error when CID is the only thing on a line as the last line in a passport         
        if file[count] == "" or count(file[count],':') == 1 and file[count].contains("cid") and file[count+1]=="":
            byr = false
            iyr = false
            eyr = false
            hgt = false
            hcl = false
            ecl = false
            pid = false
            trueCount = 0
        if file[count].contains("byr"):
            byr = true
            inc(trueCount)
        if file[count].contains("iyr"):
            iyr = true
            inc(trueCount)
        if file[count].contains("eyr"):
            eyr = true
            inc(trueCount)
        if file[count].contains("hgt"):
            hgt = true
            inc(trueCount)
        if file[count].contains("hcl"):
            hcl = true
            inc(trueCount)
        if file[count].contains("ecl"):
            ecl = true
            inc(trueCount)
        if file[count].contains("pid"):
            pid = true
            inc(trueCount)
        if trueCount == 7:
            inc(result)
        inc(count)

# Solve part two
proc partTwo(file: seq[int]): int =
    return
    
# Read in input file and converts everything to numbers
let input = readFile("input.txt").splitLines()
echo input.partOne