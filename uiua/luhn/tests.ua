~ "luhn.ua" ~ Validate

# single digit strings can not be valid
⍤⤙≍ 0 Validate "1"

# a single zero is invalid
⍤⤙≍ 0 Validate "0"

# a simple valid SIN that remains valid if reversed
⍤⤙≍ 1 Validate "059"

# a simple valid SIN that becomes invalid if reversed
⍤⤙≍ 1 Validate "59"

# a valid Canadian SIN
⍤⤙≍ 1 Validate "055 444 285"

# invalid Canadian SIN
⍤⤙≍ 0 Validate "055 444 286"

# invalid credit card
⍤⤙≍ 0 Validate "8273 1232 7352 0569"

# invalid long number with an even remainder
⍤⤙≍ 0 Validate "1 2345 6789 1234 5678 9012"

# invalid long number with a remainder divisible by 5
⍤⤙≍ 0 Validate "1 2345 6789 1234 5678 9013"

# valid number with an even number of digits
⍤⤙≍ 1 Validate "095 245 88"

# valid number with an odd number of spaces
⍤⤙≍ 1 Validate "234 567 891 234"

# valid strings with a non-digit added at the end become invalid
⍤⤙≍ 0 Validate "059a"

# valid strings with punctuation included become invalid
⍤⤙≍ 0 Validate "055-444-285"

# valid strings with symbols included become invalid
⍤⤙≍ 0 Validate "055# 444$ 285"

# single zero with space is invalid
⍤⤙≍ 0 Validate " 0"

# more than a single zero is valid
⍤⤙≍ 1 Validate "0000 0"

# input digit 9 is correctly converted to output digit 9
⍤⤙≍ 1 Validate "091"

# very long input is valid
⍤⤙≍ 1 Validate "9999999999 9999999999 9999999999 9999999999"

# valid luhn with an odd number of digits and non zero first digit
⍤⤙≍ 1 Validate "109"

# using ascii value for non-doubled non-digit isn't allowed
⍤⤙≍ 0 Validate "055b 444 285"

# using ascii value for doubled non-digit isn't allowed
⍤⤙≍ 0 Validate ":9"

# non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed
⍤⤙≍ 0 Validate "59%59"
