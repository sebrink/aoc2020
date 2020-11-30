# Type Casting

# Inferred types
var x = 5       # int
var y = "foo"   # String

# Compile time error (different types)
# x = y


var x2 = int(1.0/3)      # Type conversion
var y2: seq[int] = @[]   # Empty seq needs a type as well, specify type with ':'

# Foreign Function Interface with C (UNSAFE!)
# Function to assign each character of variable z to a pointer array. 
# Mainly here to focus on the use of the `cast` function.
var z = "Foobar"
proc ffi(foo: ptr array[6, char]) = echo repr(foo) 
ffi(cast[ptr array[6, char]](addr z[0]))

