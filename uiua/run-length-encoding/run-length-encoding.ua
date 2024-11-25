EncodeRun  ← |1 ⊂⊃(⨬(""|°⋕)>1.⧻|⊢)
EncodeRuns ← |1 ⍜(-@\0|⊜□.)
Encode     ← |1 /$"__" ⍚(EncodeRun) EncodeRuns

IsDigit   ← |1 ×⊃(≥@0|≤@9)
UpdateRun ← |2 + ⊙(×10) -@0
DecodeRun ← 0 ⊂: ▽ ⨬(1|∘)±. :
Decode    ← |1 ◌ ∧(⨬(DecodeRun|UpdateRun) IsDigit.) ⊙(0 "")
