~ "sublist.ua" ~ Classify

# Empty lists
⍤⤙≍ "equal" Classify [] []

# Empty list within non empty list
⍤⤙≍ "sublist" Classify [] [1 2 3]

# Non empty list contains empty list
⍤⤙≍ "superlist" Classify [1 2 3] []

# List equals itself
⍤⤙≍ "equal" Classify [1 2 3] [1 2 3]

# Different lists
⍤⤙≍ "unequal" Classify [1 2 3] [2 3 4]

# False start
⍤⤙≍ "sublist" Classify [1 2 5] [0 1 2 3 1 2 5 6]

# Consecutive
⍤⤙≍ "sublist" Classify [1 1 2] [0 1 1 1 2 1 2]

# Sublist at start
⍤⤙≍ "sublist" Classify [0 1 2] [0 1 2 3 4 5]

# Sublist in middle
⍤⤙≍ "sublist" Classify [2 3 4] [0 1 2 3 4 5]

# Sublist at end
⍤⤙≍ "sublist" Classify [3 4 5] [0 1 2 3 4 5]

# At start of superlist
⍤⤙≍ "superlist" Classify [0 1 2 3 4 5] [0 1 2]

# In middle of superlist
⍤⤙≍ "superlist" Classify [0 1 2 3 4 5] [2 3]

# At end of superlist
⍤⤙≍ "superlist" Classify [0 1 2 3 4 5] [3 4 5]

# First list missing element from second list
⍤⤙≍ "unequal" Classify [1 3] [1 2 3]

# Second list missing element from first list
⍤⤙≍ "unequal" Classify [1 2 3] [1 3]

# First list missing additional digits from second list
⍤⤙≍ "unequal" Classify [1 2] [1 22]

# Order matters to a list
⍤⤙≍ "unequal" Classify [1 2 3] [3 2 1]

# Same digits but different numbers
⍤⤙≍ "unequal" Classify [1 0 1] [10 1]
