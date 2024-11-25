Hundreds      ← {"" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM"}
Tens          ← {"" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC"}
Ones          ← {"" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX"}
Lookup        ← ♭ ⊞⍚(⊂⊂) Hundreds Tens Ones
Thousands     ← |1 ▽: "M" ⌊÷1000
BelowThousand ← |1 ⊡: Lookup ◿1000
ToRoman       ← |1 $"__" ⊃(Thousands|BelowThousand)
