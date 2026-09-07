Encodings ← [
  " _ | ||_|   "
  "     |  |   "
  " _  _||_    "
  " _  _| _|   "
  "   |_|  |   "
  " _ |_  _|   "
  " _ |_ |_|   "
  " _   |  |   "
  " _ |_||_|   "
  " _ |_| _|   "
]
Characters ← "0123456789?"
Lines      ← ⧈⌞∘4_3
Decode     ← ˜⊏ Characters ⊗ Encodings ≡₂♭
Validate ← ⊃(
  ⍤"Number of input lines is not a multiple of four"=0◿4⊢
| ⍤"Number of input columns is not a multiple of three"=0◿3⊣
) △
Convert ← /$"_,_" ≡Decode Lines ⊸Validate
