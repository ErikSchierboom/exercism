ZeroToNineteen ← {"zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"}
Tens           ← {"" "ten" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"}

SayUnit! ← (
  ⊃(⊸±⋅◿|˜$"_ _"⊙(^0⌊÷))
  ⨬(◌|˜$"_ _"^0)
)

Say ← |1 (
  ⍤"input out of range"×⊸⊃(≥0|<1000000000000)
  ⊸(⊗1≥1000000000_1000000_1000_100_20_0)
  ⨬(SayUnit!Say "billion" 1000000000
  | SayUnit!Say "million" 1000000
  | SayUnit!Say "thousand" 1000
  | SayUnit!Say "hundred" 100
  | ⊃(◿10|°□˜⊡Tens⌊÷10)
    ⨬(⋅|˜$"_-_"Say)⊸±
  | °□˜⊡ZeroToNineteen
  )
)
