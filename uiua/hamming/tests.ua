~ "hamming.ua" ~ Distance

# empty strands?
⍤⤙≍ 0 Distance "" ""

# single letter identical strands?
⍤⤙≍ 0 Distance "A" "A"

# long indentical strands?
⍤⤙≍ 0 Distance "GGACTGAAATCTG" "GGACTGAAATCTG"

# single letter different strands?
⍤⤙≍ 1 Distance "G" "T"

# long different strands?
⍤⤙≍ 9 Distance "GGACGGATTCTG" "AGGACGGATTCT"

# disallow empty first strand
⍤⤙≍ "strands must be of equal length" ⍣(Distance "" "G")

# disallow empty second strand
⍤⤙≍ "strands must be of equal length" ⍣(Distance "G" "")

# disallow first strand longer
⍤⤙≍ "strands must be of equal length" ⍣(Distance "AATG" "AAA")

# disallow second strand longer
⍤⤙≍ "strands must be of equal length" ⍣(Distance "ATA" "AGTG")
