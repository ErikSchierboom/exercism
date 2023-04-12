flatten_list([], []) :- !.

flatten_list([X|Xs], Flattened) :-
    X = nil,
    flatten_list(Xs, Flattened),
    !.

flatten_list([X|Xs], Flattened) :-
    is_list(X),
    flatten_list(X, XFlattened),
    flatten_list(Xs, XsFlattened),
    append(XFlattened, XsFlattened, Flattened),
    !.

flatten_list([X|Xs], [X|Flattened]) :-
    flatten_list(Xs, Flattened),
    !.
