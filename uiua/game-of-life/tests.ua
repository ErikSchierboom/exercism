~ "game-of-life.ua" ~ Tick

# Empty matrix
Matrix ← []
⍤⤙≍ 0 ⧻ Tick Matrix

# Live cells with zero live neighbors die
Matrix ← [
  [0 0 0]
  [0 1 0]
  [0 0 0]
]
Expected ← [
  [0 0 0]
  [0 0 0]
  [0 0 0]
]
⍤⤙≍ Expected Tick Matrix

# Live cells with only one live neighbor die
Matrix ← [
  [0 0 0]
  [0 1 0]
  [0 1 0]
]
Expected ← [
  [0 0 0]
  [0 0 0]
  [0 0 0]
]
⍤⤙≍ Expected Tick Matrix

# Live cells with two live neighbors stay alive
Matrix ← [
  [1 0 1]
  [1 0 1]
  [1 0 1]
]
Expected ← [
  [0 0 0]
  [1 0 1]
  [0 0 0]
]
⍤⤙≍ Expected Tick Matrix

# Live cells with three live neighbors stay alive
Matrix ← [
  [0 1 0]
  [1 0 0]
  [1 1 0]
]
Expected ← [
  [0 0 0]
  [1 0 0]
  [1 1 0]
]
⍤⤙≍ Expected Tick Matrix

# Dead cells with three live neighbors become alive
Matrix ← [
  [1 1 0]
  [0 0 0]
  [1 0 0]
]
Expected ← [
  [0 0 0]
  [1 1 0]
  [0 0 0]
]
⍤⤙≍ Expected Tick Matrix

# Live cells with four or more neighbors die
Matrix ← [
  [1 1 1]
  [1 1 1]
  [1 1 1]
]
Expected ← [
  [1 0 1]
  [0 0 0]
  [1 0 1]
]
⍤⤙≍ Expected Tick Matrix

# Bigger matrix
Matrix ← [
  [1 1 0 1 1 0 0 0]
  [1 0 1 1 0 0 0 0]
  [1 1 1 0 0 1 1 1]
  [0 0 0 0 0 1 1 0]
  [1 0 0 0 1 1 0 0]
  [1 1 0 0 0 1 1 1]
  [0 0 1 0 1 0 0 1]
  [1 0 0 0 0 0 1 1]
]
Expected ← [
  [1 1 0 1 1 0 0 0]
  [0 0 0 0 0 1 1 0]
  [1 0 1 1 1 1 0 1]
  [1 0 0 0 0 0 0 1]
  [1 1 0 0 1 0 0 1]
  [1 1 0 1 0 0 0 1]
  [1 0 0 0 0 0 0 0]
  [0 0 0 0 0 0 1 1]
]
⍤⤙≍ Expected Tick Matrix
