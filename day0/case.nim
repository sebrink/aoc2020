# Switch statements

# You can use strings!
case "charlie":
    of "alfa":
        echo "A"
    of "bravo":
        echo "B"
    of "charlie":
        echo "C"
    else:
        echo "Unrecognized letter"

# Case statements can even be sets or ranges
case 'h':
    of 'a', 'e', 'i', 'o', 'u':
        echo "Vowel"
    of '\127'..'\255':
        echo "Unknown"
    else:
        echo "Consonant"

# Case statements are expressions! This function sets the case statement to a variable!
# Constant of lowest possible int is `low(int)`, constant of highest int is `high(int)`
proc positiveOrNegative(num: int): string =
    result = case num:
        of low(int).. -1:
            "negative"
        of 0:
            "zero"
        of 1..high(int):
            "positive"
        else:
            "impossible"

echo positiveOrNegative(-1)
