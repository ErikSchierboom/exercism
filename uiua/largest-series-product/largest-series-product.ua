Validate       ← |2.2 ⍤ "span must be smaller than string length" ◡(≤⧻) ⍤ "span must not be negative" ≥0 ,
Digits         ← |1 ⍣(∵⋕) (⍤ "invalid character in digits")
LargestProduct ← |2 /↥ ≡/× ⍣(◫) [1] : Digits Validate
