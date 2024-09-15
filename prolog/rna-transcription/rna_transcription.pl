complement('G', 'C').
complement('C', 'G').
complement('T', 'A').
complement('A', 'U').

rna_transcription(Rna, Dna) :-
    string_chars(Rna, RnaChars),
    maplist(complement, RnaChars, DnaChars),
    string_chars(Dna, DnaChars).
