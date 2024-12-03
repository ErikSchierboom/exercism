Create ← ⊂⊙□⊂

Directions ← {"north" "east" "south" "west"}
Deltas     ← [0_1 1_0 0_¯1 ¯1_0]
Moves      ← "RLA"

Update! ← ⍜(°□⊡)(^0)
Rotate  ← |2 Update!(°□⊢▽ ↻⊙(⊸⌕□⟜Directions) :) 2 :
Left    ← |1 Rotate 1
Right   ← |1 Rotate ¯1
D       ← ⊡⟜Deltas ⊗□⟜Directions
Walk!   ← Update!(+⊙(^0D))⊙⟜(°□⊡2)
Advance ← |1 Walk!(⊢)0 Walk!(⊣)1
Move    ← ∧(⨬(Right|Left|Advance) ⊗⟜Moves) :
