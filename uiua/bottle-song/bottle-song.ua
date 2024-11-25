Counts ← {
  "no"
  "one"
  "two"
  "three"
  "four"
  "five"
  "six"
  "seven"
  "eight"
  "nine"
  "ten"
}

Capitalize ← |1 ⍜⊢⌵
Bottles    ← |1 ⨬("bottles"|"bottle") =1
Count      ← |1 ⊡ : Counts
Hanging    ← |1 $"_ green _ hanging on the wall," ⊃(⍚Capitalize Count|Bottles)
Fall       ← "And if one green bottle should accidentally fall,"
Remaining  ← |1 $"There'll be _ green _ hanging on the wall." ⊃(Count|Bottles) -1
Verse      ← |1 [⊃(□ Hanging|□ Hanging|□ Fall|□ Remaining)]
Recite     ← |2 ⍜⇌(↘1) ♭≡(⊂ : □"" Verse) ↙:⇌ +1⇡
