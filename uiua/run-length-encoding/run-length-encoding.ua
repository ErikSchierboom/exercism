EncodeRun  ← ⊂⊃(⨬(""|°⋕)>1.⧻|⊢)
EncodeRuns ← ⍜(-@\0|⊜□.)
Encode     ← /$"__" ⍚(EncodeRun) EncodeRuns

IsDigit   ← ×⊃(≥@0|≤@9)
UpdateRun ← + ⊙(×10) -@0
DecodeRun ← 0 ⊂: ▽ ⨬(1|∘)±. :
Decode    ← ◌ ∧(⨬(DecodeRun|UpdateRun) IsDigit.) ⊙(0 "")
