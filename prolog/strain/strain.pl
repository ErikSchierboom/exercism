keep(_, [], []) :- !.
keep(Goal, [X|Xs], Filtered) :-
    keep(Goal, Xs, FilteredXs),
    (call(Goal, X) -> Filtered = [X|FilteredXs]; Filtered = FilteredXs).

discard(_, [], []) :- !.
discard(Goal, [X|Xs], Filtered) :-
    discard(Goal, Xs, FilteredXs),
    (call(Goal, X) -> Filtered = FilteredXs; Filtered = [X|FilteredXs]).
