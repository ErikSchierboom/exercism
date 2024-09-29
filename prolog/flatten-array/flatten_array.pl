flatten_list([], []) :- !.
flatten_list([nil|Xs], Flattened) :- flatten_list(Xs, Flattened), !.

flatten_list([X|Xs], Flattened) :-
    is_list(X),
    append(X, Xs, Appended),
    flatten_list(Appended, Flattened),
    !.

flatten_list([X|Xs], [X|Flattened]) :- flatten_list(Xs, Flattened), !.
