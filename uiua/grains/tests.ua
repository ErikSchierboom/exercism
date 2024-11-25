~ "grains.ua" ~ Square Total

# grains on square 1?
⍤⤙≍ 1 Square 1

# grains on square 2?
⍤⤙≍ 2 Square 2

# grains on square 3?
⍤⤙≍ 4 Square 3

# grains on square 4?
⍤⤙≍ 8 Square 4

# grains on square 16?
⍤⤙≍ 32768 Square 16

# grains on square 32?
⍤⤙≍ 2147483648 Square 32

# grains on square 64?
⍤⤙≍ 9223372036854775808 Square 64

# square greater than 64 is invalid
⍤⤙≍ "square must be between 1 and 64" ⍣(Square 65)

# square 0 is invalid
⍤⤙≍ "square must be between 1 and 64" ⍣(Square 0)

# negative square is invali
⍤⤙≍ "square must be between 1 and 64" ⍣(Square `1)

# returns the total number of grains on the board
⍤⤙≍ 18446744073709551615 Total
