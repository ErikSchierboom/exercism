Validate         ← ⍤"invalid nucleotide in strand" /×∈"ACGT"
NucleotideCounts ← map ⟜(≡/+⊞=) "ACGT" Validate.
