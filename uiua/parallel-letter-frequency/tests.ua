~ "parallel-letter-frequency.ua" ~ Frequencies

# no texts
⍤⤙≍ 0 ⧻ Frequencies {}

# one text with one letter
⍤⤙≍ map "a" [1] Frequencies {"a"}

# one text with multiple letters
⍤⤙≍ map "bcd" [2 3 1] Frequencies {"bbcccd"}

# two texts with one letter
⍤⤙≍ map "ef" [1 1] Frequencies {"e" "f"}

# two texts with multiple letters
⍤⤙≍ map "ghi" [2 3 1] Frequencies {"ggh" "hhi"}

# ignore letter casing
⍤⤙≍ map "m" [2] Frequencies {"m" "M"}

# ignore whitespace
⍤⤙≍ 0 ⧻ Frequencies {"   " "	" "\n\t"}

# ignore punctuation
⍤⤙≍ 0 ⧻ Frequencies {"!" "?" ";" "," "."}

# ignore numbers
⍤⤙≍ 0 ⧻ Frequencies {"1" "2" "3" "4" "5" "6" "7" "8" "9"}

# combination of lower- and uppercase letters, punctuation and white space
Expected ← map "abcdefghiklmnoprstuvwy" [32 4 6 14 37 7 8 29 19 6 12 7 19 22 7 17 16 30 9 2 9 4]
Texts    ← {"There, peeping among the cloud-wrack above a dark tower high up in the mountains, Sam saw a white star twinkle for a while. The beauty of it smote his heart, as he looked up out of the forsaken land, and hope returned to him. For like a shaft, clear and cold, the thought pierced him that in the end, the shadow was only a small and passing thing: there was light and high beauty forever beyond its reach."}
⍤⤙≍ Expected Frequencies Texts

# many small texts
Texts ← {"abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc" "abbccc"}
⍤⤙≍ map "abc" [50 100 150] Frequencies Texts
