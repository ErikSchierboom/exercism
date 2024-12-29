Parse     ← ⊜∘≠@\n.
Diagonal  ← ⬚@\W⤸ 0_0
Rotations ← {⊃(∘|⍉⇌|⍉⇌⍉⇌|⍉⇌⍉⇌⍉⇌)}
Patterns  ← /◇⊂ ⍚Rotations {⊃(¤|Diagonal)}
Indices   ← ⍚(⊚⦷) ⊙¤ Patterns
Regular   ← ◇(⊟⊃⊢⊣)
Corners   ← ◇(⊟⊃(⊣⊢|⊢⊣) ↯⊂:⍜(⊢|.√)△.)
Coordinates ← +1 ⍣(
  ⨬(Regular
  | Regular
  | ⇌Regular
  | ⇌Regular
  | Regular
  | Corners
  | ⇌Regular
  | ⇌Corners)
| [])
Search ← map ⟜(⍚(/◇⊂ ⍚Coordinates °⊏ Indices)) ⊙(¤Parse)
