:- use_module(library(clpfd)).

cell(Rows, X, Y, Cell) :-
    nth0(Y, Rows, Row),
    nth0(X, Row, Cell).

adjacent_mine(Rows, X, Y) :-
    between(-1, 1, Dx),
    between(-1, 1, Dy),
    NeighborX #= X + Dx,
    NeighborY #= Y + Dy,
    cell(Rows, NeighborX, NeighborY, '*').

annotate_cell(_, '*', _, _, '*') :- !.
annotate_cell(Rows, _, X, Y, AnnotatedCell) :-
    findall(1, adjacent_mine(Rows, X, Y), Mines),
    length(Mines, Count),
    (Count #= 0 -> AnnotatedCell = ' '; atom_number(AnnotatedCell, Count)).    

annotate_row(_, [], _, _, []) :- !.
annotate_row(Rows, [Cell|Cells], X, Y, [AnnotatedCell|AnnotatedCells]) :-
    NextX #= X + 1,
    annotate_cell(Rows, Cell, X, Y, AnnotatedCell),
    annotate_row(Rows, Cells, NextX, Y, AnnotatedCells).

annotate_board(_, [], _, []) :- !.
annotate_board(Rows, [Row|Rest], Y, [AnnotatedRow|AnnotatedRows]) :-
    NextY #= Y + 1,
    annotate_row(Rows, Row, 0, Y, AnnotatedRowChars),
    string_chars(AnnotatedRow, AnnotatedRowChars),
    annotate_board(Rows, Rest, NextY, AnnotatedRows), !.

annotate(Board, AnnotatedBoard) :-
    maplist(string_chars, Board, Rows),
    annotate_board(Rows, Rows, 0, AnnotatedBoard).
