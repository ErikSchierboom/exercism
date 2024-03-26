:- use_module(library(clpfd)).

saddle_point(Matrix, RowMaxes, ColMins, X, Y) :-
    nth1(Y, Matrix, Row),
    nth1(X, Row, Cell),
    nth1(Y, RowMaxes, RowMax),
    nth1(X, ColMins, ColMin),
    Cell #>= RowMax, Cell #=< ColMin.

saddle_points(Matrix, SaddlePoints) :-
    transpose(Matrix, Transposed),
    maplist(max_list, Matrix, RowMaxes),
    maplist(min_list, Transposed, ColMins),
    length(RowMaxes, Rows),
    length(ColMins, Cols),
    findall((X, Y), (between(1, Rows, Y), between(1, Cols, X), saddle_point(Matrix, RowMaxes, ColMins, X, Y)), SaddlePoints).
