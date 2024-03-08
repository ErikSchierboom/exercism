:- use_module(library(clpfd)).

egg_count(0, 0) :- !.
egg_count(EncodedCount, Count) :-
    NewEncodedCount #= EncodedCount >> 1,
    egg_count(NewEncodedCount, NewCount),
    Count #= NewCount + (EncodedCount /\ 1).
