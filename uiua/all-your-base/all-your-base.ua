ValidBases ← (
  ⍤"input base must be >= 2"≥2
  ⍤"output base must be >= 2"≥2
)
ValidDigits ← ⍤"all digits must satisfy 0 <= d < input base" /×↧⊃(≥0|<:)
Valid       ← ⊃(ValidDigits|⋅ValidBases)
FromInput   ← /+×ⁿ:⊙(⇌°⊏):
ToOutput    ← ⨬([0]|◿:⌊÷⊸⊃(ⁿ⊙⋅∘|⋅∘)◡(⇌⇡+1⌊ₙ:))±.
Rebase      ← ToOutput FromInput ◡Valid
