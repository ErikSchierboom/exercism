~ "protein-translation.ua" ~ Proteins

# Empty RNA sequence results in no proteins
⍤⤙≍ {} Proteins ""

# Methionine RNA sequence
⍤⤙≍ {"Methionine"} Proteins "AUG"

# Phenylalanine RNA sequence 1
⍤⤙≍ {"Phenylalanine"} Proteins "UUU"

# Phenylalanine RNA sequence 2
⍤⤙≍ {"Phenylalanine"} Proteins "UUC"

# Leucine RNA sequence 1
⍤⤙≍ {"Leucine"} Proteins "UUA"

# Leucine RNA sequence 2
⍤⤙≍ {"Leucine"} Proteins "UUG"

# Serine RNA sequence 1
⍤⤙≍ {"Serine"} Proteins "UCU"

# Serine RNA sequence 2
⍤⤙≍ {"Serine"} Proteins "UCC"

# Serine RNA sequence 3
⍤⤙≍ {"Serine"} Proteins "UCA"

# Serine RNA sequence 4
⍤⤙≍ {"Serine"} Proteins "UCG"

# Tyrosine RNA sequence 1
⍤⤙≍ {"Tyrosine"} Proteins "UAU"

# Tyrosine RNA sequence 2
⍤⤙≍ {"Tyrosine"} Proteins "UAC"

# Cysteine RNA sequence 1
⍤⤙≍ {"Cysteine"} Proteins "UGU"

# Cysteine RNA sequence 2
⍤⤙≍ {"Cysteine"} Proteins "UGC"

# Tryptophan RNA sequence #
⍤⤙≍ {"Tryptophan"} Proteins "UGG"

# STOP codon RNA sequence 1
⍤⤙≍ {} Proteins "UAA"

# STOP codon RNA sequence 2
⍤⤙≍ {} Proteins "UAG"

# STOP codon RNA sequence 3
⍤⤙≍ {} Proteins "UGA"

# Sequence of two protein codons translates into proteins
⍤⤙≍ {"Phenylalanine" "Phenylalanine"} Proteins "UUUUUU"

# Sequence of two different protein codons translates into proteins
⍤⤙≍ {"Leucine" "Leucine"} Proteins "UUAUUG"

# Translate RNA strand into correct protein list
⍤⤙≍ {"Methionine" "Phenylalanine" "Tryptophan"} Proteins "AUGUUUUGG"

# Translation stops if STOP codon at beginning of sequence
⍤⤙≍ {} Proteins "UAGUGG"

# Translation stops if STOP codon at end of two-codon sequence
⍤⤙≍ {"Tryptophan"} Proteins "UGGUAG"

# Translation stops if STOP codon at end of three-codon sequence
⍤⤙≍ {"Methionine" "Phenylalanine"} Proteins "AUGUUUUAA"

# Translation stops if STOP codon in middle of three-codon sequence
⍤⤙≍ {"Tryptophan"} Proteins "UGGUAGUGG"

# Translation stops if STOP codon in middle of six-codon sequence
⍤⤙≍ {"Tryptophan" "Cysteine" "Tyrosine"} Proteins "UGGUGUUAUUAAUGGUUU"

# Sequence of two non-STOP codons does not translate to a STOP codon
⍤⤙≍ {"Methionine" "Methionine"} Proteins "AUGAUG"

# Unknown amino acids not part of a codon can't translate
⍤⤙≍ "error: Invalid codon" Proteins "XYZ"

# Incomplete RNA sequence can't translate
⍤⤙≍ "error: Invalid codon" Proteins "AUGU"
