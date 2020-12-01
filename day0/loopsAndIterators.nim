# Yield statements are used in the body of iterators to return the data back to the iterator: https://nim-lang.org/docs/manual.html#statements-and-expressions-yield-statement

type 
    CustomRange = object
        low: int
        high: int

# Items and Pairs
iterator items(range: CustomRange): int =
    var i = range.low
    while i <= range.high:
        yield i
        inc i

iterator pairs(range: CustomRange): tuple[a: int, b: char] =
    for i in range: # Uses CustomRange.items
        yield (i, char(i+ord('a')))

for i, c in CustomRange(low: 1, high: 3):
    echo c

# Operators
#... operator allows iterating through ordinal types
iterator `...`*[T](a: T, b: T): T = 
    var res: T = T(a) 
    while res <= b:
        yield res
        inc res

# This is subtle, but it is calling the `...` iterator above
for i in 0...5:
    echo i

# Inline iterators
iterator countTo(n: int): int =
    var i =0
    while i <= n:
        yield i
        inc i

# Closure Iterators
proc countTo(n: int): iterator(): int =
    return iterator(): int = 
        var i = 0
        while i <= n:
            yield i
            inc i 

let countTo20 = countTo(20)

echo countTo20()

var output = ""

# Raw iterator usage
while true:
    # Grab an element
    let next = countTo20()
    # Is the element what I want? If it isn't, discard it
    if finished(countTo20):
        echo "BreakOut"
        break
    # Loop body goes here
    output.add($next & " ")

echo output

output = "" 
let countTo9 = countTo(9)
for i in countTo9():
    output.add($i)
echo output