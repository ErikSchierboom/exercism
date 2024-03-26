:- use_module(library(clpfd)).

slices(Input, Size, After, [Slice|Slices]) :-
    sub_string(Input, After, Size, _, Slice),
    NewAfter #= After + 1,
    slices(Input, Size, NewAfter, Slices), !.

slices(_, _, _, []).

slices(Input, Size, Slices) :-
    string_length(Input, Length),
    Size in 1..Length,
    slices(Input, Size, 0, Slices).
