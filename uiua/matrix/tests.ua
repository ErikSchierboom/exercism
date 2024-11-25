~ "matrix.ua" ~ Column Row

# extract row from one number matrix
⍤⤙≍ [1] Row "1" 1

# can extract row
⍤⤙≍ [3 4] Row "1 2\n3 4" 2

# extract row where numbers have different widths
⍤⤙≍ [10 20] Row "1 2\n10 20" 2

# can extract row from non-square matrix with no corresponding column
⍤⤙≍ [8 7 6] Row "1 2 3\n4 5 6\n7 8 9\n8 7 6" 4

# extract column from one number matrix?
⍤⤙≍ [1] Column "1" 1

# can extract column?
⍤⤙≍ [3 6 9] Column "1 2 3\n4 5 6\n7 8 9" 3

# can extract column from non-square matrix with no corresponding row?
⍤⤙≍ [4 8 6] Column "1 2 3 4\n5 6 7 8\n9 8 7 6" 4

# extract column where numbers have different widths?
⍤⤙≍ [1903 3 4] Column "89 1903 3\n18 3 1\n9 4 800" 2
