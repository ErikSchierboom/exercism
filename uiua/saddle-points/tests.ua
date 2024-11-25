~ "saddle-points.ua" ~ SaddlePoints

# Can identify single saddle point
Matrix ← [
  [9 8 7]
  [5 3 2]
  [6 6 7]
]
⍤⤙≍ [2_1] SaddlePoints Matrix

# Can identify that empty matrix has no saddle points
Matrix ← [
  []
]
⍤⤙≍ 0 ⧻ SaddlePoints Matrix

# Can identify lack of saddle points when there are none
Matrix ← [
  [1 2 3]
  [3 1 2]
  [2 3 1]
]
⍤⤙≍ 0 ⧻ SaddlePoints Matrix

# Can identify multiple saddle points in a column
Matrix ← [
  [4 5 4]
  [3 5 5]
  [1 5 4]
]
⍤⤙≍ [1_2 2_2 3_2] SaddlePoints Matrix

# Can identify multiple saddle points in a row
Matrix ← [
  [6 7 8]
  [5 5 5]
  [7 5 6]
]
⍤⤙≍ [2_1 2_2 2_3] SaddlePoints Matrix

# Can identify saddle point in bottom right corner
Matrix ← [
  [8 7 9]
  [6 7 6]
  [3 2 5]
]
⍤⤙≍ [3_3] SaddlePoints Matrix

# Can identify saddle points in a non square matrix
Matrix ← [
  [3 1 3]
  [3 2 4]
]
⍤⤙≍ [1_1 1_3] SaddlePoints Matrix

# Can identify that saddle points in a single column matrix are those with the minimum value
Matrix ← [
  [2]
  [1]
  [4]
  [1]
]
⍤⤙≍ [2_1 4_1] SaddlePoints Matrix

# Can identify that saddle points in a single row matrix are those with the maximum value
Matrix ← [
  [2 5 3 5]
]
⍤⤙≍ [1_2 1_4] SaddlePoints Matrix
