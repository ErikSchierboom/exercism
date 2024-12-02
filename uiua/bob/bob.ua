Responses ← {
  "Whatever."
  "Whoa, chill out!"
  "Fine. Be that way!"
  "Sure."
  "Calm down, I know what I'm doing!"
}

Trim       ← ▽\↥¬⦷" ".
IsSilent   ← =0⧻Trim
IsShouting ← ×⊃(≍⌵.|¬≍¯⌵.)
IsQuestion ← ≍@?⬚@ ⊣⍜(⇌|Trim)
HeyBob     ← °□⊡:Responses ++⊃(IsShouting|×2IsSilent|×3IsQuestion)