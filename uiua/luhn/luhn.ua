Sanitize    ← ▽≠@\s.
Digits      ← ⇌∵⋕
MinLength   ← ⍤.>1⧻
Multipliers ← ↯⊙[1_2]△
Multiply    ← ×⊸Multipliers
Normalize   ← ∵(+⊃(⌊÷10|◿10))
Verify      ← =0◿10/+
Validate    ← ⍣(Verify Normalize Multiply⊸MinLength Digits Sanitize) 0
