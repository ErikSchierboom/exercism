Straight ← /↥♭⌕⊙([⍉.])
Diagonal ← /↥♭⌕⊙([⇌.])⬚@\W⤸0_0
Wins     ← /+≡(+⊃(Straight|Diagonal)↯3) ⊙¤ "XO"
Xs       ← /+=@X♭
Os       ← /+=@O♭
Draw     ← ≍4_5⊂⊃(Os|Xs)
Ongoing  ← ↧⊃(≥0|≤1)-⊃(Os|Xs)
GameState ← (
  ⊃(Wins|Draw|Ongoing)
  ⨬(⨬(⨬("invalid"|"ongoing")|"draw")|"win"|"invalid")
)
