tally([], []) :- !.
tally(List, Counts) :- aggregate(set(Element-Count), aggregate(count, member(Element, List), Count), Counts).

merge([], Y, Y) :- !.
merge([Letter-Count|Xs], Y, Z) :-
    (select(Letter-ExistingCount, Y, Ys) ->
        NewCount is Count + ExistingCount,
        merge(Xs, [Letter-NewCount|Ys], Z);
        merge(Xs, [Letter-Count|Y], Z)).

letters(Text, Letters) :-
    string_lower(Text, LowerText),
    string_chars(LowerText, Chars),
    include([Char]>>char_type(Char, alpha), Chars, Letters).

frequencies_in_text(Text, Frequencies) :-
    letters(Text, Letters),
    tally(Letters, Frequencies).

frequencies(Texts, Frequencies) :-
    concurrent_maplist(frequencies_in_text, Texts, TextFrequencies),
    foldl(merge, TextFrequencies, [], Frequencies).
