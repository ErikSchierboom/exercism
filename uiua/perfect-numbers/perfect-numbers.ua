Validate       ← |1.0 ⍤ "number must be positive" >0
Factors        ← |1 ▽:⟜(=0◿)⊸(↘1⇡)
AliquotSum     ← |1 /+ Factors
ClassifyNumber ← |1 ⨬("abundant"|"perfect"|"deficient") +1±-⊸AliquotSum Validate .
