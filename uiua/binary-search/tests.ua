~ "binary-search.ua" ~ Search

# finds a value in an array with one element
⍤⤙≍ 0 Search [6] 6

# finds a value in the middle of an array
⍤⤙≍ 3 Search [1 3 4 6 8 9 11] 6

# finds a value at the beginning of an array
⍤⤙≍ 0 Search [1 3 4 6 8 9 11] 1

# finds a value at the end of an array
⍤⤙≍ 6 Search [1 3 4 6 8 9 11] 11

# finds a value in an array of odd length
⍤⤙≍ 9 Search [1 3 5 8 13 21 34 55 89 144 233 377 634] 144

# finds a value in an array of even length
⍤⤙≍ 5 Search [1 3 5 8 13 21 34 55 89 144 233 377] 21

# identifies that a value is not included in the array
⍤⤙≍ ¯1 Search [1 3 4 6 8 9 11] 7

# a value smaller than the array's smallest value is not found
⍤⤙≍ ¯1 Search [1 3 4 6 8 9 11] 0

# a value larger than the array's largest value is not found
⍤⤙≍ ¯1 Search [1 3 4 6 8 9 11] 13

# nothing is found in an empty array
⍤⤙≍ ¯1 Search [] 1

# nothing is found when the left and right bounds cross
⍤⤙≍ ¯1 Search [1 2] 0
