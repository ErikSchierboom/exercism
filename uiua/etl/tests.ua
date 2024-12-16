~ "etl.ua" ~ Transform

# single letter
Input    ← map {"1"} {"A"}
Expected ← map "a" [1]
⍤⤙≍ Expected Transform Input

# single score with multiple letters
Input    ← map {"1"} {"AEIOU"}
Expected ← map "aeiou" [1 1 1 1 1]
⍤⤙≍ Expected Transform Input

# multiple scores with multiple letters
Input    ← map {"1" "2"} {"AE" "DG"}
Expected ← map "adeg" [1 2 1 2]
⍤⤙≍ Expected Transform Input

# multiple scores with differing numbers of letters
Input    ← map {"1" "2" "3" "4" "5" "8" "10"} {"AEIOULNRST" "DG" "BCMP" "FHVWY" "K" "JX" "QZ"}
Expected ← map "abcdefghijklmnopqrstuvwxyz" [1 3 3 2 1 4 2 4 1 8 5 1 3 1 1 3 10 1 1 1 1 4 4 8 4 10]
⍤⤙≍ Expected Transform Input
