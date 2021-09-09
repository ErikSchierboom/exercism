nucleotide_complement('G', X) :- X = 'C'.
nucleotide_complement('C', X) :- X = 'G'.
nucleotide_complement('T', X) :- X = 'A'.
nucleotide_complement('A', X) :- X = 'U'.

rna_transcription(Rna, Dna) :-
    string_chars(Rna, Nucleotides),
    maplist(nucleotide_complement, Nucleotides, Complement),
    string_chars(Dna, Complement).
