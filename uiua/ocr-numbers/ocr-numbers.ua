Shapes ← [
  "   "
  "  |"
  " _ "
  " _|"
  "| |"
  "|_ "
  "|_|"
]
Encodings ← [
  2_4_6_0
  0_1_1_0
  2_3_5_0
  2_3_3_0
  0_6_1_0
  2_5_3_0
  2_5_6_0
  2_1_1_0
  2_6_6_0
  2_6_3_0
]
Encoding ← ≡(⊗⟜Shapes)
Lines    ← ≡(↙4↘)×4⊙¤⇡÷4⊢△.
Digits   ← ≡≡(↙3↘)×3⊙¤⇡÷3⊣△.
Number   ← ⨬("?"|°⋕) <10. ⊗⟜Encodings Encoding
Numbers  ← /⊂≡Number Digits
Validate ← ⊃(
  ⍤"Number of input lines is not a multiple of four"=0◿4⊢
| ⍤"Number of input columns is not a multiple of three"=0◿3⊣
) △
Convert ← /$"_,_" ≡Numbers Lines ⊸Validate
