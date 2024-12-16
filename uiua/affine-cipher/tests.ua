~ "affine-cipher.ua" ~ Decode Encode

# encode yes
⍤⤙≍ "xbt" Encode "yes" 5 7

# encode no
⍤⤙≍ "fu" Encode "no" 15 18

# encode OMG
⍤⤙≍ "lvz" Encode "OMG" 21 3

# encode O M G
⍤⤙≍ "hjp" Encode "O M G" 25 47

# encode mindblowingly
⍤⤙≍ "rzcwa gnxzc dgt" Encode "mindblowingly" 11 15

# encode numbers
⍤⤙≍ "jqgjc rw123 jqgjc rw" Encode "Testing,1 2 3, testing." 3 4

# encode deep thought
⍤⤙≍ "iynia fdqfb ifje" Encode "Truth is fiction." 5 17

# encode all the letters
⍤⤙≍ "swxtj npvyk lruol iejdc blaxk swxmh qzglf" Encode "The quick brown fox jumps over the lazy dog." 17 33

# encode with a not coprime to m
⍤⤙≍ "a and m must be coprime" ⍣(Encode "This is a test." 6 17)

# decode exercism
⍤⤙≍ "exercism" Decode "tytgn fjr" 3 7

# decode a sentence
⍤⤙≍ "anobstacleisoftenasteppingstone" Decode "qdwju nqcro muwhn odqun oppmd aunwd o" 19 16

# decode numbers
⍤⤙≍ "testing123testing" Decode "odpoz ub123 odpoz ub" 25 7

# decode all the letters
⍤⤙≍ "thequickbrownfoxjumpsoverthelazydog" Decode "swxtj npvyk lruol iejdc blaxk swxmh qzglf" 17 33

# decode with no spaces in input
⍤⤙≍ "thequickbrownfoxjumpsoverthelazydog" Decode "swxtjnpvyklruoliejdcblaxkswxmhqzglf" 17 33

# decode with too many spaces
⍤⤙≍ "jollygreengiant" Decode "vszzm    cly   yd cg    qdp" 15 16

# decode with a not coprime to m
⍤⤙≍ "a and m must be coprime" ⍣(Decode "Test" 13 5)
