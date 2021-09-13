complement('G', 'C').
complement('C', 'G').
complement('T', 'A').
complement('A', 'U').

rna_transcription(Rna, Dna) :-
    string_chars(Rna, Nucleotides),
    maplist(complement, Nucleotides, Complement),
    string_chars(Dna, Complement).
