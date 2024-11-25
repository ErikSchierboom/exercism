~ "isogram.ua" ~ IsIsogram

# empty string?
⍤⤙≍ 1 IsIsogram ""

# isogram with only lower case characters?
⍤⤙≍ 1 IsIsogram "isogram"

# word with one duplicated character?
⍤⤙≍ 0 IsIsogram "eleven"

# word with one duplicated character from the end of the alphabet?
⍤⤙≍ 0 IsIsogram "zzyzx"

# longest reported english IsIsogram
⍤⤙≍ 1 IsIsogram "subdermatoglyphic"

# word with duplicated character in mixed case?
⍤⤙≍ 0 IsIsogram "Alphabet"

# word with duplicated character in mixed case, lowercase first?
⍤⤙≍ 0 IsIsogram "alphAbet"

# hypothetical isogrammic word with hyphen?
⍤⤙≍ 1 IsIsogram "thumbscrew-japingly"

# hypothetical word with duplicated character following hyphen?
⍤⤙≍ 0 IsIsogram "thumbscrew-jappingly"

# isogram with duplicated hyphen?
⍤⤙≍ 1 IsIsogram "six-year-old"

# made-up name that is an IsIsogram
⍤⤙≍ 1 IsIsogram "Emily Jung Schwartzkopf"

# duplicated character in the middle?
⍤⤙≍ 0 IsIsogram "accentor"

# same first and last characters?
⍤⤙≍ 0 IsIsogram "angola"

# word with duplicated character and with two hyphens?
⍤⤙≍ 0 IsIsogram "up-to-date"
