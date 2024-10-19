:- use_module(library(clpfd)).

cell(Rows, X, Y, Cell) :- nth1(Y, Rows, Row), nth1(X, Row, Cell).

live_neighbor(Rows, X, Y) :-
    between(-1, 1, Dx),
    between(-1, 1, Dy),
    NeighborX #= X + Dx,
    NeighborY #= Y + Dy,
    (NeighborX #\= X #\/ NeighborY #\= Y),
    cell(Rows, NeighborX, NeighborY, 1).

next_cell(Rows, Y, Cell, X, NextCell) :-
    findall(1, live_neighbor(Rows, X, Y), LiveNeighbors),
    length(LiveNeighbors, Count),
    (Count #= 3; Count #= 2, Cell = 1) -> NextCell = 1; NextCell = 0.

next_row(Rows, Y, Row, NextRow) :-
    length(Row, Length),
    numlist(1, Length, Xs),
    maplist(next_cell(Rows, Y), Row, Xs, NextRow).

tick([], []) :- !.
tick(Current, Next) :-
    length(Current, Height),
    numlist(1, Height, Ys),
    maplist(next_row(Current), Ys, Current, Next).
