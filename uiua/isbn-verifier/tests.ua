~ "isbn-verifier.ua" ~ IsValid

# valid isbn
⍤⤙≍ 1 IsValid "3-598-21508-8"

# invalid isbn check digit
⍤⤙≍ 0 IsValid "3-598-21508-9"

# valid isbn with a check digit of 10
⍤⤙≍ 1 IsValid "3-598-21507-X"

# check digit is a character other than X
⍤⤙≍ 0 IsValid "3-598-21507-A"

# invalid check digit in isbn is not treated as zero
⍤⤙≍ 0 IsValid "4-598-21507-B"

# invalid character in isbn is not treated as zero
⍤⤙≍ 0 IsValid "3-598-P1581-X"

# X is only valid as a check digit
⍤⤙≍ 0 IsValid "3-598-2X507-9"

# valid isbn without separating dashes
⍤⤙≍ 1 IsValid "3598215088"

# isbn without separating dashes and X as check digit
⍤⤙≍ 1 IsValid "359821507X"

# isbn without check digit and dashes
⍤⤙≍ 0 IsValid "359821507"

# too long isbn and no dashes
⍤⤙≍ 0 IsValid "3598215078X"

# too short isbn
⍤⤙≍ 0 IsValid "00"

# isbn without check digit
⍤⤙≍ 0 IsValid "3-598-21507"

# check digit of X should not be used for 0
⍤⤙≍ 0 IsValid "3-598-21515-X"

# empty isbn
⍤⤙≍ 0 IsValid ""

# input is 9 characters
⍤⤙≍ 0 IsValid "134456729"

# invalid characters are not ignored after checking length
⍤⤙≍ 0 IsValid "3132P34035"

# invalid characters are not ignored before checking length
⍤⤙≍ 0 IsValid "3598P215088"

# input is too long but contains a valid isbn
⍤⤙≍ 0 IsValid "98245726788"
