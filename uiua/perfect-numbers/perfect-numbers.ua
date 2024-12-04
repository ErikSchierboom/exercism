Validate       ← ⍤ "number must be positive" >0
Factors        ← ▽:⟜(=0◿)⊸(↘1⇡)
AliquotSum     ← /+ Factors
ClassifyNumber ← ⨬("abundant"|"perfect"|"deficient") +1±-⊸AliquotSum Validate .
