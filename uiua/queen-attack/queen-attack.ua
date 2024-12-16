┌─╴Queen
  Valid     ← ×⊓≥≤0,7
  New       ← ⊟⊓(⍤"invalid row" Valid.|⍤"invalid column" Valid.)
  Row       ← ⊢
  Column    ← ⊣
  CanAttack ← ↥↥⊃(=|⋅⋅=|=⊙(⌵-)⌵-) ⊃(∩Row|∩Column)
└─╴
