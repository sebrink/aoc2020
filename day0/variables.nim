# Variables 

#[ 
3 types of variables
let = immutable
var = mutable
const = computed at compilation time
]#

proc getAlphabet(): string =    # function, string return
    var accm = ""               # Init the variable
    for letter in 'a'..'z':     # Example of an iterator, explained later
        accm.add(letter)        # Adding letters to the string
    return accm

# Computed at compilation time
const alphabet = getAlphabet()  # Calling a function

# Mutable variables
var             # Multi line variable declarations 
    a = "foo"   # Init to a string
    b = 0       # Init to 0
    c: int      # Init to 0

# Immutable variables
let 
    d = "foo"   # Init to string
    e = 5       # Init to 5
    # f: float    # Compile-time error, must be init'd at creation

# Works
a.add("bar")    # String concat
b += 1          # Addition
c = 3           # Assignment

# Fails
# alphabet = "abc"    # Const can't be modified at run-time

# Fails
# d.add("bar")    # immutable
# e += 1          # immutable