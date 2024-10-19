:- use_module(library(clpfd)).

cell(Rows, X, Y, Cell) :- nth1(Y, Rows, Row), nth1(X, Row, Cell).

adjacent_mine(Rows, X, Y) :-
    between(-1, 1, Dx),
    between(-1, 1, Dy),
    NeighborX #= X + Dx,
    NeighborY #= Y + Dy,
    cell(Rows, NeighborX, NeighborY, '*').

annotate_cell(_, _, '*', _, '*') :- !.
annotate_cell(Rows, Y, _, X, AnnotatedCell) :-
    findall(1, adjacent_mine(Rows, X, Y), Mines),
    length(Mines, Count),
    (Count #= 0 -> AnnotatedCell = ' '; atom_number(AnnotatedCell, Count)).    

annotate_row(Rows, Y, Row, AnnotatedRow) :-
    length(Row, Length),
    numlist(1, Length, Xs),
    maplist(annotate_cell(Rows, Y), Row, Xs, AnnotatedCells),
    string_chars(AnnotatedRow, AnnotatedCells).

annotate([], []) :- !.
annotate([""], [""]) :- !.
annotate(Board, AnnotatedBoard) :-
    maplist(string_chars, Board, Rows),
    length(Rows, Height),
    numlist(1, Height, Ys),
    maplist(annotate_row(Rows), Ys, Rows, AnnotatedBoard).
