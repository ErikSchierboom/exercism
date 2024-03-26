:- use_module(library(clpfd)).

factors(N, _, []) :- N #< 2, !.
factors(N, Factor, [Factor|Factors]) :-
    N mod Factor #= 0,
    NewN #= N // Factor,
    factors(NewN, Factor, Factors), !.
factors(N, Factor, Factors) :-
    NewFactor #= Factor + 1,
    factors(N, NewFactor, Factors).

factors(N, Factors) :- factors(N, 2, Factors).
