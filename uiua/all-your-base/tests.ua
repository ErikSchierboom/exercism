~ "all-your-base.ua" ~ Rebase

# Single bit one to decimal
Digits     ← [1]
InputBase  ← 2
OutputBase ← 10
Expected   ← [1]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Binary to single decimal
Digits     ← [1 0 1]
InputBase  ← 2
OutputBase ← 10
Expected   ← [5]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Single decimal to binary
Digits     ← [5]
InputBase  ← 10
OutputBase ← 2
Expected   ← [1 0 1]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Binary to multiple decimal
Digits     ← [1 0 1 0 1 0]
InputBase  ← 2
OutputBase ← 10
Expected   ← [4 2]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Decimal to binary
Digits     ← [4 2]
InputBase  ← 10
OutputBase ← 2
Expected   ← [1 0 1 0 1 0]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Trinary to hexadecimal
Digits     ← [1 1 2 0]
InputBase  ← 3
OutputBase ← 16
Expected   ← [2 10]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Hexadecimal to trinary
Digits     ← [2 10]
InputBase  ← 16
OutputBase ← 3
Expected   ← [1 1 2 0]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# 15-bit integer
Digits     ← [3 46 60]
InputBase  ← 97
OutputBase ← 73
Expected   ← [6 10 45]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Empty list
Digits     ← []
InputBase  ← 2
OutputBase ← 10
Expected   ← [0]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Single zero
Digits     ← [0]
InputBase  ← 10
OutputBase ← 2
Expected   ← [0]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Multiple zeros
Digits     ← [0 0 0]
InputBase  ← 10
OutputBase ← 2
Expected   ← [0]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Leading zeros
Digits     ← [0 6 0]
InputBase  ← 7
OutputBase ← 10
Expected   ← [4 2]
⍤⤙≍ Expected Rebase Digits InputBase OutputBase

# Input base is one
Digits     ← [0]
InputBase  ← 1
OutputBase ← 10
⍤⤙≍ "input base must be >= 2" ⍣(Rebase Digits InputBase OutputBase)

# Input base is zero
Digits     ← []
InputBase  ← 0
OutputBase ← 10
⍤⤙≍ "input base must be >= 2" ⍣(Rebase Digits InputBase OutputBase)

# Input base is negative
Digits     ← [1]
InputBase  ← ¯2
OutputBase ← 10
⍤⤙≍ "input base must be >= 2" ⍣(Rebase Digits InputBase OutputBase)

# Negative digit
Digits     ← [1 ¯1 1 0 1 0]
InputBase  ← 2
OutputBase ← 10
⍤⤙≍ "all digits must satisfy 0 <= d < input base" ⍣(Rebase Digits InputBase OutputBase)

# Invalid positive digit
Digits     ← [1 2 1 0 1 0]
InputBase  ← 2
OutputBase ← 10
⍤⤙≍ "all digits must satisfy 0 <= d < input base" ⍣(Rebase Digits InputBase OutputBase)

# Output base is one
Digits     ← [1 0 1 0 1 0]
InputBase  ← 2
OutputBase ← 1
⍤⤙≍ "output base must be >= 2" ⍣(Rebase Digits InputBase OutputBase)

# Output base is zero
Digits     ← [7]
InputBase  ← 10
OutputBase ← 0
⍤⤙≍ "output base must be >= 2" ⍣(Rebase Digits InputBase OutputBase)

# Output base is negative
Digits     ← [1]
InputBase  ← 2
OutputBase ← ¯7
⍤⤙≍ "output base must be >= 2" ⍣(Rebase Digits InputBase OutputBase)

# Both bases are negative
Digits     ← [1]
InputBase  ← ¯2
OutputBase ← ¯7
⍤⤙≍ "input base must be >= 2" ⍣(Rebase Digits InputBase OutputBase)
