Validate       ← ⍤"span must be smaller than string length" ◡(≤⧻) ⍤"span must not be negative" ≥0 ,
Digits         ← ⍣(∵⋕|⍤"invalid character in digits")
LargestProduct ← /↥⧈/× : Digits Validate
