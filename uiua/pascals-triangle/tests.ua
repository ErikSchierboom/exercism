~ "pascals-triangle.ua" ~ Triangle

# zero rows
⍤⤙≍ {
  []
} Triangle 0

# single row
⍤⤙≍ {
  [1]
} Triangle 1

# two rows
⍤⤙≍ {
  [1]
  [1 1]
} Triangle 2

# three rows
⍤⤙≍ {
  [1]
  [1 1]
  [1 2 1]
} Triangle 3

# four rows
⍤⤙≍ {
  [1]
  [1 1]
  [1 2 1]
  [1 3 3 1]
} Triangle 4

# five rows
⍤⤙≍ {
  [1]
  [1 1]
  [1 2 1]
  [1 3 3 1]
  [1 4 6 4 1]
} Triangle 5

# six rows
⍤⤙≍ {
  [1]
  [1 1]
  [1 2 1]
  [1 3 3 1]
  [1 4 6 4 1]
  [1 5 10 10 5 1]
} Triangle 6

# ten rows
⍤⤙≍ {
  [1]
  [1 1]
  [1 2 1]
  [1 3 3 1]
  [1 4 6 4 1]
  [1 5 10 10 5 1]
  [1 6 15 20 15 6 1]
  [1 7 21 35 35 21 7 1]
  [1 8 28 56 70 56 28 8 1]
  [1 9 36 84 126 126 84 36 9 1]
} Triangle 10
