Hundreds      ← {"" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM"}
Tens          ← {"" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC"}
Ones          ← {"" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX"}
Lookup        ← ♭⊞⍚(⊂⊂) Hundreds Tens Ones
Thousands     ← ˜▽ "M" ⌊÷1000
BelowThousand ← ˜⊡ Lookup ◿1000
ToRoman       ← $"__" ⊃(Thousands|BelowThousand)
