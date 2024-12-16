~ "kindergarten-garden.ua" ~ Plants

# garden with single student?
Garden ← $ RC
         $ GG
⍤⤙≍ {"radishes" "clover" "grass" "grass"} Plants Garden "Alice"

# different garden with single student?
Garden ← $ VC
         $ RC
⍤⤙≍ {"violets" "clover" "radishes" "clover"} Plants Garden "Alice"

# garden with two students?
Garden ← $ VVCG
         $ VVRC
⍤⤙≍ {"clover" "grass" "radishes" "clover"} Plants Garden "Bob"

# second student's garden?
Garden ← $ VVCCGG
         $ VVCCGG
⍤⤙≍ {"clover" "clover" "clover" "clover"} Plants Garden "Bob"

# third student's garden?
Garden ← $ VVCCGG
         $ VVCCGG
⍤⤙≍ {"grass" "grass" "grass" "grass"} Plants Garden "Charlie"

# for Alice, first student's garden?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"violets" "radishes" "violets" "radishes"} Plants Garden "Alice"

# for Bob, second student's garden?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"clover" "grass" "clover" "clover"} Plants Garden "Bob"

# for Charlie?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"violets" "violets" "clover" "grass"} Plants Garden "Charlie"

# for David?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"radishes" "violets" "clover" "radishes"} Plants Garden "David"

# for Eve?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"clover" "grass" "radishes" "grass"} Plants Garden "Eve"

# for Fred?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"grass" "clover" "violets" "clover"} Plants Garden "Fred"

# for Ginny?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"clover" "grass" "grass" "clover"} Plants Garden "Ginny"

# for Harriet?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"violets" "radishes" "radishes" "violets"} Plants Garden "Harriet"

# for Ileana?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"grass" "clover" "violets" "clover"} Plants Garden "Ileana"

# for Joseph?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"violets" "clover" "violets" "grass"} Plants Garden "Joseph"

# for Kincaid, second to last student's garden?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"grass" "clover" "clover" "grass"} Plants Garden "Kincaid"

# for Larry, last student's garden?
Garden ← $ VRCGVVRVCGGCCGVRGCVCGCGV
         $ VRCCCGCRRGVCGCRVVCVGCGCV
⍤⤙≍ {"grass" "violets" "clover" "violets"} Plants Garden "Larry"
