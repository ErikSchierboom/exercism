nucleotide(Nucleotide) :- member(Nucleotide, ['A', 'C', 'G', 'T']).

nucleotide_count(Dna, Counts) :-
    string_chars(Dna, Letters),
    maplist(nucleotide, Letters),
    findall(
        (Nucleotide, Count),
        (   nucleotide(Nucleotide),
            (   aggregate(count, member(Nucleotide, Letters), TempCount)
            ->  Count = TempCount
            ;   Count = 0
            )
        ),
        Counts).
