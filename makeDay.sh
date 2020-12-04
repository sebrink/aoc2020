#!/bin/bash
# I do this everyday, why not just have bash make the structure for me?
if [[ $# != 1 ]];then
    echo Gib day number
    exit
fi 
mkdir day$1
cp ./template/template.nim day$1/day$1.nim
sed -i '' "s/DayTemplate/Day04/g" day$1/day04.nim
echo -e "# Day$1\n\n### Lessons Learned\n#####TODO\n\n### Prompt\n#####TODO" >>day$1/README.md
# This could be automated, but there is auth to go grab the input file, so not worth it since I go to read the prompt anyways
touch ./day$1/input.txt 