Codons     ← {"AUG" "UUU" "UUC" "UUA" "UUG" "UCU" "UCC" "UCA" "UCG" "UAU" "UAC" "UGU" "UGC" "UGG" "UAA" "UAG" "UGA"}
AminoAcids ← {"Methionine" ."Phenylalanine" ."Leucine" ..."Serine" ."Tyrosine" ."Cysteine" "Tryptophan" .."STOP"}
Mapping    ← map Codons AminoAcids
Sequences  ← ⬚@ ↯∞_3
Protein    ← °□⍣(get : Mapping|⍤"error: Invalid codon")
UntilStop  ← ↙⊗ □"STOP".
Proteins   ← UntilStop ⍚Protein Sequences
