# ifElseWhile usage

import strutils, random

# Randomizes the rng on each run
randomize()

# Set immutable var
let answer = rand(10)
while true:
    echo "I have a number from 1 to 10, what is it?"
    let guess = parseInt(stdin.readLine)                # Take user fed input

    if guess < answer: 
        echo "Too low!"
    elif guess > answer:
        echo "Too high!"
    else:
        echo "Poggers!"
        break

# Will be covered in more detail later, but this can be used to make a label to break from nested loops
block busyloops:
    while true:
        while true:
            break busyloops # Breaks out of the nested loop
