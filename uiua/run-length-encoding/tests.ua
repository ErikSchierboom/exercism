~ "run-length-encoding.ua" ~ Decode Encode

# Encode empty string
⍤⤙≍ "" Encode ""

# Encode single characters only are encoded without count
⍤⤙≍ "XYZ" Encode "XYZ"

# Encode string with no single characters
⍤⤙≍ "2A3B4C" Encode "AABBBCCCC"

# Encode single characters mixed with repeated characters
⍤⤙≍ "12WB12W3B24WB" Encode "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"

# Encode multiple whitespace mixed in string
⍤⤙≍ "2 hs2q q2w2 " Encode "  hsqq qww  "

# Encode lowercase characters
⍤⤙≍ "2a3b4c" Encode "aabbbcccc"

# Decode empty string
⍤⤙≍ "" Decode ""

# Decode single characters only
⍤⤙≍ "XYZ" Decode "XYZ"

# Decode string with no single characters
⍤⤙≍ "AABBBCCCC" Decode "2A3B4C"

# Decode single characters with repeated characters
⍤⤙≍ "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB" Decode "12WB12W3B24WB"

# Decode multiple whitespace mixed in string
⍤⤙≍ "  hsqq qww  " Decode "2 hs2q q2w2 "

# Decode lowercase string
⍤⤙≍ "aabbbcccc" Decode "2a3b4c"

# Encode followed by decode gives original string
⍤⤙≍ "zzz ZZ  zZ" Decode Encode "zzz ZZ  zZ"
