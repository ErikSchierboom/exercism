Parse     ← ⊜∘≠@\n.
Rectangle ← /↧≡(≍⊃↙↘2) ⍜(↙2↘1⊢|⇌) ⍉
Corners   ← ▽≡Rectangle. ⧅<4 ⊚=@+
Valid ← (
  ⊙¤
  ∩(⍜(-|⇡+1) ⊃(⊢|⊣))°⊟⍉
  ↧⊃(
    /↧∊"+-"♭≡⊡⊞⊂⊂⊃(⊢|⊣)
  | /↧∊"+|"♭≡⊡⊞⊂⊙(⊂⊃(⊢|⊣))
  )
)
Rectangles ← /+ ≡Valid ⊙¤ ⊸Corners Parse
