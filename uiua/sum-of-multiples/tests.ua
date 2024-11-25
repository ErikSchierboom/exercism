~ "sum-of-multiples.ua" ~ SumOfMultiples

# no multiples within limit?
⍤⤙≍ 0 SumOfMultiples 3_5 1

# one factor has multiples within limit?
⍤⤙≍ 3 SumOfMultiples 3_5 4

# more than one multiple within limit?
⍤⤙≍ 9 SumOfMultiples 3 7

# more than one factor with multiples within limit?
⍤⤙≍ 23 SumOfMultiples 3_5 10

# each multiple is only counted once?
⍤⤙≍ 2318 SumOfMultiples 3_5 100

# a much larger limit?
⍤⤙≍ 233168 SumOfMultiples 3_5 1000

# three factors?
⍤⤙≍ 51 SumOfMultiples 7_13_17 20

# factors not relatively prime?
⍤⤙≍ 30 SumOfMultiples 4_6 15

# some pairs of factors relatively prime and some not?
⍤⤙≍ 4419 SumOfMultiples 5_6_8 150

# one factor is a multiple of another?
⍤⤙≍ 275 SumOfMultiples 5_25 51

# much larger factors?
⍤⤙≍ 2203160 SumOfMultiples 43_47 10000

# all numbers are multiples of 1?
⍤⤙≍ 4950 SumOfMultiples 1 100

# no factors means an empty sum?
⍤⤙≍ 0 SumOfMultiples [] 10000

# the only multiple of 0 is 0?
⍤⤙≍ 0 SumOfMultiples 0 1

# the factor 0 does not affect the sum of multiples of other factors?
⍤⤙≍ 3 SumOfMultiples 3_0 4

# solutions using include-exclude must extend to cardinality greater than 3?
⍤⤙≍ 39614537 SumOfMultiples 2_3_5_7_11 10000
