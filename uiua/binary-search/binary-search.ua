Compare  ← ±-⊡⊙⋅⋅∘∘
Bounds   ← 0-1⧻
Middle   ← ⌊÷2+
NotFound ← ¯1◌◌◌◌
Found    ← ⊙⋅⋅⋅⋅
GoLeft   ← :⊙⊙◌-1
GoRight  ← ⊙◌+1

Loop ← |4 ⨬(
  NotFound
| ◡Middle
  +1⊃(Compare|⊙⊙⊙⊙∘)
  ⨬(Loop GoLeft|Found|Loop GoRight)
) ◡≥

Search ← |2 Loop Bounds .
