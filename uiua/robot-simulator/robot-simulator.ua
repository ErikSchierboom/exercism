Directions ← {"north" "east" "south" "west"}
Deltas     ← [0_1 1_0 0_¯1 ¯1_0]
Moves      ← "RLA"

Create  ← ⊂⊙□⊂
Update! ← ⍜(°□⊡)(^0)
Rotate  ← Update!(°□⊢▽ ↻⊙(⊸⌕□⟜Directions) :) 2 :
Left    ← Rotate 1
Right   ← Rotate ¯1
D       ← ⊡⟜Deltas ⊗□⟜Directions
Walk!   ← Update!(+⊙(^0D))⊙⟜(°□⊡2)
Advance ← Walk!(⊢)0 Walk!(⊣)1
Move    ← ∧(⨬(Right|Left|Advance) ⊗⟜Moves) :
