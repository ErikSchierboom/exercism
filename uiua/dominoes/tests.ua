~ "dominoes.ua" ~ CanChain

# Empty input = empty output
⍤⤙≍ 1 CanChain []

# Singleton input = singleton output
⍤⤙≍ 1 CanChain [1_1]

# Singleton that can't be chained
⍤⤙≍ 0 CanChain [1_2]

# Three elements
⍤⤙≍ 1 CanChain [1_2 3_1 2_3]

# Can reverse dominoes
⍤⤙≍ 1 CanChain [1_2 1_3 2_3]

# Can't be chained
⍤⤙≍ 0 CanChain [1_2 4_1 2_3]

# Disconnected - simple
⍤⤙≍ 0 CanChain [1_1 2_2]

# Disconnected - double loop
⍤⤙≍ 0 CanChain [1_2 2_1 3_4 4_3]

# Disconnected - single isolated
⍤⤙≍ 0 CanChain [1_2 2_3 3_1 4_4]

# Need backtrack
⍤⤙≍ 1 CanChain [1_2 2_3 3_1 2_4 2_4]

# Separate loops
⍤⤙≍ 1 CanChain [1_2 2_3 3_1 1_1 2_2 3_3]

# Nine elements
⍤⤙≍ 1 CanChain [1_2 5_3 3_1 1_2 2_4 1_6 2_3 3_4 5_6]

# Separate three-domino loops
⍤⤙≍ 0 CanChain [1_2 2_3 3_1 4_5 5_6 6_4]
