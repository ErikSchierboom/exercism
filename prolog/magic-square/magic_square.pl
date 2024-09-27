:- use_module(library(clpfd)).

diagonals(Rows, LeftRightDiagonal, RightLeftDiagonal) :-
    length(Rows, N),
    numlist(1, N, Indices),
    reverse(Indices, ReverseIndices),
    pairs_keys_values(LeftRightIndices, Indices, Indices),    
    pairs_keys_values(RightLeftIndices, ReverseIndices, Indices),
    maplist(diagonal_element(Rows), LeftRightIndices, LeftRightDiagonal),
    maplist(diagonal_element(Rows), RightLeftIndices, RightLeftDiagonal).

diagonal_element(Rows, X-Y, Value) :- nth1(Y, Rows, Row), nth1(X, Row, Value).

magic_square(Rows) :-
    maplist(sumlist, Rows, RowSums),
    maplist(=(Sum), RowSums),
    transpose(Rows, Cols),
    maplist(sumlist, Cols, ColSums),
    maplist(=(Sum), ColSums),
    diagonals(Rows, LeftRightDiagonal, RightLeftDiagonal),
    sumlist(LeftRightDiagonal, Sum),
    sumlist(RightLeftDiagonal, Sum).
