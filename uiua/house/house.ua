Subjects ← ⨬(
  ""
| "house that Jack built."
| "malt that lay in"
| "rat that ate"
| "cat that killed"
| "dog that worried"
| "cow with the crumpled horn that tossed"
| "maiden all forlorn that milked"
| "man all tattered and torn that kissed"
| "priest all shaven and shorn that married"
| "rooster that crowed in the morn that woke"
| "farmer sowing his corn that kept"
| "horse and the hound and the horn that belonged to")

Verse  ← |1 □$"This is the _" /$"_ the _" ⇌≡(□Subjects) +1⇡
Recite ← |2 ≡(Verse) ⍜-⇡ ⊙(+1)
