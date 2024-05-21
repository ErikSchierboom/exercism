"protein-translation.8th" f:include
needs exercism/test
with: test
29 tests

"Empty RNA sequence results in no proteins"
    ( "" >proteins )
    []
    equal?

SKIP-REST-OF-TESTS

"Methionine RNA sequence"
    ( "AUG" >proteins )
    ["Methionine"]
    equal?

"Phenylalanine RNA sequence 1"
    ( "UUU" >proteins )
    ["Phenylalanine"]
    equal?

"Phenylalanine RNA sequence 2"
    ( "UUC" >proteins )
    ["Phenylalanine"]
    equal?

"Leucine RNA sequence 1"
    ( "UUA" >proteins )
    ["Leucine"]
    equal?

"Leucine RNA sequence 2"
    ( "UUG" >proteins )
    ["Leucine"]
    equal?

"Serine RNA sequence 1"
    ( "UCU" >proteins )
    ["Serine"]
    equal?

"Serine RNA sequence 2"
    ( "UCC" >proteins )
    ["Serine"]
    equal?

"Serine RNA sequence 3"
    ( "UCA" >proteins )
    ["Serine"]
    equal?

"Serine RNA sequence 4"
    ( "UCG" >proteins )
    ["Serine"]
    equal?

"Tyrosine RNA sequence 1"
    ( "UAU" >proteins )
    ["Tyrosine"]
    equal?

"Tyrosine RNA sequence 2"
    ( "UAC" >proteins )
    ["Tyrosine"]
    equal?

"Cysteine RNA sequence 1"
    ( "UGU" >proteins )
    ["Cysteine"]
    equal?

"Cysteine RNA sequence 2"
    ( "UGC" >proteins )
    ["Cysteine"]
    equal?

"Tryptophan RNA sequence"
    ( "UGG" >proteins )
    ["Tryptophan"]
    equal?

"STOP codon RNA sequence 1"
    ( "UAA" >proteins )
    []
    equal?

"STOP codon RNA sequence 2"
    ( "UAG" >proteins )
    []
    equal?

"STOP codon RNA sequence 3"
    ( "UGA" >proteins )
    []
    equal?

"Sequence of two protein codons translates into proteins"
    ( "UUUUUU" >proteins )
    ["Phenylalanine", "Phenylalanine"]
    equal?

"Sequence of two different protein codons translates into proteins"
    ( "UUAUUG" >proteins )
    ["Leucine", "Leucine"]
    equal?

"Translate RNA strand into correct protein list"
    ( "AUGUUUUGG" >proteins )
    ["Methionine", "Phenylalanine", "Tryptophan"]
    equal?

"Translation stops if STOP codon at beginning of sequence"
    ( "UAGUGG" >proteins )
    []
    equal?

"Translation stops if STOP codon at end of two-codon sequence"
    ( "UGGUAG" >proteins )
    ["Tryptophan"]
    equal?

"Translation stops if STOP codon at end of three-codon sequence"
    ( "AUGUUUUAA" >proteins )
    ["Methionine", "Phenylalanine"]
    equal?

"Translation stops if STOP codon in middle of three-codon sequence"
    ( "UGGUAGUGG" >proteins )
    ["Tryptophan"]
    equal?

"Translation stops if STOP codon in middle of six-codon sequence"
    ( "UGGUGUUAUUAAUGGUUU" >proteins )
    ["Tryptophan", "Cysteine", "Tyrosine"]
    equal?

"Unknown amino acids, not part of a codon, can't translate"
    ( "XYZ" >proteins )
    null?

"Incomplete RNA sequence can't translate"
    ( "AUGU" >proteins )
    null?

"Incomplete RNA sequence can translate if valid until a STOP codon"
    ( "UUCUUCUAAUGGU" >proteins )
    ["Phenylalanine", "Phenylalanine"]
    equal?

end-of-tests
;with
