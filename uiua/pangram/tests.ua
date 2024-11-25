~ "pangram.ua" ~ IsPangram

# empty sentence
⍤⤙≍ 0 IsPangram ""

# missing letters replaced by numbers
⍤⤙≍ 0 IsPangram "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"

# mixed case and punctuation
⍤⤙≍ 1 IsPangram "\"Five quacking Zephyrs jolt my wax bed.\""

# missing letter x
⍤⤙≍ 0 IsPangram "a quick movement of the enemy will jeopardize five gunboats"

# perfect lower case
⍤⤙≍ 1 IsPangram "abcdefghijklmnopqrstuvwxyz"

# missing letter h
⍤⤙≍ 0 IsPangram "five boxing wizards jump quickly at it"

# with numbers
⍤⤙≍ 1 IsPangram "the 1 quick brown fox jumps over the 2 lazy dogs"

# only lower case
⍤⤙≍ 1 IsPangram "the quick brown fox jumps over the lazy dog"

# missing d and g
⍤⤙≍ 0 IsPangram "the quick brown fox jumps over with lazy FX"

# with underscores
⍤⤙≍ 1 IsPangram "the_quick_brown_fox_jumps_over_the_lazy_dog"
