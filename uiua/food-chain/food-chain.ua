Animals ← {"fly" "spider" "bird" "cat" "dog" "goat" "cow" "horse"}
Phrases ← {
  ""
  "It wriggled and jiggled and tickled inside her."
  "How absurd to swallow a bird!"
  "Imagine that, to swallow a cat!"
  "What a hog, to swallow a dog!"
  "Just opened her throat and swallowed a goat!"
  "I don't know how she swallowed a cow!"
  ""
}

VerseBegin     ← |1 ▽>0∵(⧻°□) . ⊂⊃(□$"I know an old lady who swallowed a _." ⊡ : Animals|⊡ : Phrases)
VerseCatch     ← |1 ⨬(∘|$"_ that wriggled and jiggled and tickled inside her")≍"spider".
VerseSwallow   ← |2 □$"She swallowed the _ to catch the _." ⊙(VerseCatch°□)
VerseSwalllows ← |1 ≡(VerseSwallow ⊃(⊡ 1|⊡ 0)) ⇌↙ ⊙(◫2 Animals)
VerseMiddle    ← |1 ⨬({})(VerseSwalllows)×⊃(>0|<7).
VerseEnd       ← |1 □⨬("She's dead, of course!"|"I don't know why she swallowed the fly. Perhaps she'll die.") <7
Verse          ← |1 □⊂⊃(⊂⊃(VerseBegin|VerseMiddle)|VerseEnd)
Verses         ← |2 ≡Verse ⇌⍜-⇡ -1
Recite         ← |2 ⍜⇌(↘1) ∧(⊂⊂ : {""}°□) : {} Verses
