Gifts ← {
  "a Partridge in a Pear Tree"
  "two Turtle Doves"
  "three French Hens"
  "four Calling Birds"
  "five Gold Rings"
  "six Geese-a-Laying"
  "seven Swans-a-Swimming"
  "eight Maids-a-Milking"
  "nine Ladies Dancing"
  "ten Lords-a-Leaping"
  "eleven Pipers Piping"
  "twelve Drummers Drumming"
}

Days ← {
  "first"
  "second"
  "third"
  "fourth"
  "fifth"
  "sixth"
  "seventh"
  "eighth"
  "ninth"
  "tenth"
  "eleventh"
  "twelfth"
}

DayGifts ← |1 ⍜⊜∘≡⋅", and a" ⦷ ", a". /$"_, _" ≡(⊡ : Gifts)⇌⇡+1
Day      ← |1 ⊡ : Days
Line     ← |1 $"On the _ day of Christmas my true love gave to me: _." ⊃(Day|DayGifts)
Recite   ← |2 ≡(□Line) ⍜-⇡-1
