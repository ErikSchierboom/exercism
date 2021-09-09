nucleotide('A').
nucleotide('C').
nucleotide('G').
nucleotide('T').

letter_count(Letters, Letter, Mapping) :-
    include(==(Letter), Letters, Matches),
    length(Matches, Count),
    Mapping = (Letter, Count).

nucleotide_count(Dna, Counts) :-
    string_chars(Dna, Letters),
    maplist(nucleotide, Letters),
    maplist(letter_count(Letters), ['A','C','G', 'T'], Counts).
