~ "palindrome-products.ua" ~ Largest Smallest

# Find the smallest palindrome from single digit factors
Expected ← [1_1_1]
⍤⤙≍ Expected Smallest 1 9

# Find the largest palindrome from single digit factors
Expected ← [9_1_9 9_3_3]
⍤⤙≍ Expected⍆ Largest 1 9

# Find the smallest palindrome from double digit factors
Expected ← [121_11_11]
⍤⤙≍ Expected Smallest 10 99

# Find the largest palindrome from double digit factors
Expected ← [9009_91_99]
⍤⤙≍ Expected Largest 10 99

# Find the smallest palindrome from triple digit factors
Expected ← [10201_101_101]
⍤⤙≍ Expected Smallest 100 999

# Find the largest palindrome from triple digit factors
Expected ← [906609_913_993]
⍤⤙≍ Expected Largest 100 999

# Empty result for smallest if no palindrome in the range
Expected ← ↯0_3[]
⍤⤙≍ Expected Smallest 1002 1003

# Empty result for largest if no palindrome in the range
Expected ← ↯0_3[]
⍤⤙≍ Expected Largest 15 15

# Error result for smallest if min is more than max
⍤⤙≍ "invalid range" ⍣(Smallest 10000 1)

# Error result for largest if min is more than max
⍤⤙≍ "invalid range" ⍣(Largest 2 1)
