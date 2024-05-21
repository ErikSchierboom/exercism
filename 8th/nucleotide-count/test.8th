"nucleotide-count.8th" f:include
needs exercism/test
with: test
5 tests

"empty strand"
    ( "" nucleotide-counts )
    {"A": 0, "C": 0, "G": 0, "T": 0}
    equal?

SKIP-REST-OF-TESTS

"can count one nucleotide in single-character input"
    ( "G" nucleotide-counts )
    {"A": 0, "C": 0, "G": 1, "T": 0}
    equal?

"strand with repeated nucleotide"
    ( "GGGGGGG" nucleotide-counts )
    {"A": 0, "C": 0, "G": 7, "T": 0}
    equal?

"strand with multiple nucleotides"
    ( "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC" nucleotide-counts )
    {"A": 20, "C": 12, "G": 17, "T": 21}
    equal?

"strand with invalid nucleotides"
    ( "AGXXACT" nucleotide-counts )
    null?

end-of-tests
;with
