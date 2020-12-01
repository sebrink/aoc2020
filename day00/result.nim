# Result Special Variable
# Serves as an implicit return varaible

proc getAlphabet(): string =
    for letter in 'a'..'z':
        result.add(letter)

echo getAlphabet() # This will print out the alphabet

#[ Possible gotcha, never use a variable named result, 
only use the implicit result variable ]#
proc unexpected(): int =
    var result = 5
    result += 5

echo unexpected() # Will print out 0, as the implicit result has not changed.