~ "spiral-matrix.ua" ~ SpiralMatrix

# Empty spiral
⍤⤙≍ 0 ⧻ SpiralMatrix 0

# Trivial spiral
Expected ← [
  [1]
]
⍤⤙≍ Expected SpiralMatrix 1

# Spiral of size 2
Expected ← [
  [1 2]
  [4 3]
]
⍤⤙≍ Expected SpiralMatrix 2

# Spiral of size 3
Expected ← [
  [1 2 3]
  [8 9 4]
  [7 6 5]
]
⍤⤙≍ Expected SpiralMatrix 3

# Spiral of size 4

Expected ← [
  [1 2 3 4]
  [12 13 14 5]
  [11 16 15 6]
  [10 9 8 7]
]
⍤⤙≍ Expected SpiralMatrix 4

# Spiral of size 5
Expected ← [
  [1 2 3 4 5]
  [16 17 18 19 6]
  [15 24 25 20 7]
  [14 23 22 21 8]
  [13 12 11 10 9]
]
⍤⤙≍ Expected SpiralMatrix 5
