# Day04 Advent of Code 2020
import strutils

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

# The built in find function in nim wasn't working for me so I just rewrote it.
proc findIndexOf(line: seq[string],item: string): int =
    var index: int
    result = -1
    let lineLengh = line.len
    while index <= lineLengh-1:
        if line[index].contains(item):
            result = index
        inc(index)

# Solve part two
proc partTwo(file: seq[string]): int =
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
        # 4 digits between 1920 and 2002
        if file[count].contains("byr"):
            let line = file[count].split({' '})
            let attr = line[findIndexOf(line,"byr")]
            let value = parseInt(attr[4..len(attr)-1])
            if value >= 1920 and value <= 2002:
                byr = true
                inc(trueCount)
        # 4 digits between 2010 and 2020
        if file[count].contains("iyr"):
            let line = file[count].split({' '})
            let attr = line[findIndexOf(line,"iyr")]
            let value = parseInt(attr[4..len(attr)-1])
            if value >= 2010 and value <= 2020:
                iyr = true
                inc(trueCount)
        # 4 digits between 2020 and 2030
        if file[count].contains("eyr"):
            let line = file[count].split({' '})
            let attr = line[findIndexOf(line,"eyr")]
            let value = parseInt(attr[4..len(attr)-1])
            if value >= 2020 and value <= 2030:
                eyr = true
                inc(trueCount)
        # A number followed by in or cm
        # If cm between 150 and 193
        # If in between 59 and 76
        if file[count].contains("hgt"):
            let line = file[count].split({' '})
            let attr = line[findIndexOf(line,"hgt")]
            let value = attr[4..len(attr)-1]
            if value.contains("in"):
                let numericalValue = parseInt(attr[4..len(attr)-3]) # Chop off the in or cm at the end
                if numericalValue >= 59 and numericalValue <= 76:
                    hgt = true
                    inc(trueCount)
            if value.contains("cm"):
                let numericalValue = parseInt(attr[4..len(attr)-3]) # Chop off the in or cm at the end
                if numericalValue >= 150 and numericalValue <= 193:
                    hgt = true
                    inc(trueCount)
        # A # followed by exactly six characters from 0-9 or -af
        if file[count].contains("hcl"):
            let line = file[count].split({' '})
            let attr = line[findIndexOf(line,"hcl")]
            let value = attr[4..len(attr)-1]
            var endValue = true
            if value.len == 7 and value[0] == '#':
                for i in value[1..len(value)-1]:
                    if i notin ('a'..'f') and i notin ('0'..'9'):
                        endValue = true
                        break
                    else:
                        endValue = false
            if endValue == false:
                hcl = true
                inc(trueCount)
        # One of the following: amb,blue,brn,gry,grn,hzl,oth
        if file[count].contains("ecl"):
            let line = file[count].split({' '})
            let attr = line[findIndexOf(line,"ecl")]
            let value = attr[4..len(attr)-1]
            if value in ["amb","blu","brn","gry","grn","hzl","oth"]:
                ecl = true
                inc(trueCount)
        # Nine digit number including leading 0s
        if file[count].contains("pid"):
            let line = file[count].split({' '})
            let attr = line[findIndexOf(line,"pid")]
            let value = attr[4..len(attr)-1]
            var endValue = false
            if value.len == 9:
                for i in value[0..len(value)-1]:
                    if i notin ('0'..'9'):
                        endValue = false
                        break
                    else:
                        endValue = true
                if endValue == true:
                    pid = true
                    inc(trueCount)
        if trueCount == 7:
            inc(result)
        inc(count) 

# Read in input file and converts everything to numbers
let input = readFile("input.txt").splitLines()
echo input.partOne
echo input.partTwo