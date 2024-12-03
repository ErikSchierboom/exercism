~ "rotational-cipher.ua" ~ Rotate

# rotate a by 0, same output as input
⍤⤙≍ "a" Rotate "a" 0

# rotate a by 1
⍤⤙≍ "b" Rotate "a" 1

# rotate a by 26, same output as input
⍤⤙≍ "a" Rotate "a" 26

# rotate m by 13
⍤⤙≍ "z" Rotate "m" 13

# rotate n by 13 with wrap around alphabet
⍤⤙≍ "a" Rotate "n" 13

# rotate capital letters
⍤⤙≍ "TRL" Rotate "OMG" 5

# rotate spaces
⍤⤙≍ "T R L" Rotate "O M G" 5

# rotate numbers
⍤⤙≍ "Xiwxmrk 1 2 3 xiwxmrk" Rotate "Testing 1 2 3 testing" 4

# rotate punctuation
⍤⤙≍ "Gzo'n zvo, Bmviyhv!" Rotate "Let's eat, Grandma!" 21

# rotate all letters
⍤⤙≍ "Gur dhvpx oebja sbk whzcf bire gur ynml qbt." Rotate "The quick brown fox jumps over the lazy dog." 13
