RandomRange   ← + ⌊× ⊙[⍥⚂]
RandomLetters ← (RandomRange 26 2 @A)
RandomDigits  ← (RandomRange 10 3 @0)
GenerateName  ← (⊂ RandomLetters RandomDigits)
