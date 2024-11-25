~ "nucleotide-count.ua" ~ NucleotideCounts

# empty strand?
⍤⤙≍ map "ACGT" 0_0_0_0 NucleotideCounts ""

# can count one nucleotide in single-character input?
⍤⤙≍ map "ACGT" 0_0_1_0 NucleotideCounts "G"

# strand with repeated nucleotide?
⍤⤙≍ map "ACGT" 0_0_7_0 NucleotideCounts "GGGGGGG"

# strand with multiple nucleotides?
⍤⤙≍ map "ACGT" 20_12_17_21 NucleotideCounts "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

# strand with invalid nucleotides
⍤⤙≍ "invalid nucleotide in strand" ⍣(NucleotideCounts "AGXXACT")
