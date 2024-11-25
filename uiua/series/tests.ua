~ "series.ua" ~ Slices

# slices of one from one?
⍤⤙≍ ["1"] Slices 1 "1"

# slices of one from two?
⍤⤙≍ ["1" "2"] Slices 1 "12"

# slices of two?
⍤⤙≍ ["35"] Slices 2 "35"

# slices of two overlap?
⍤⤙≍ ["91" "14" "42"] Slices 2 "9142"

# slices can include duplicates?
⍤⤙≍ ["777" "777" "777" "777"] Slices 3 "777777"

# slices of a long series?
⍤⤙≍ ["91849" "18493" "84939" "49390" "93904" "39042" "90424" "04243"] Slices 5 "918493904243"

# slice length is too large?
⍤⤙≍ [] Slices 6 "12345"

# slice length is way too large?
⍤⤙≍ [] Slices 42 "12345"

# slice length cannot be zero?
⍤⤙≍ [] Slices 0 "12345"

# slice length cannot be negative?
⍤⤙≍ [] Slices ¯1 "123"

# empty series is invalid?
⍤⤙≍ [] Slices 1 ""
