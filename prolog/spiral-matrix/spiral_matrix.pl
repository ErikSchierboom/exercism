spiralValue(_, StartValue, 0, Col, Value) :- Value is StartValue + Col, !.
spiralValue(Size, StartValue, Row, 0, Value) :- Value is StartValue + Size * 4 -4 - Row, !.
spiralValue(Size, StartValue, Row, Col, Value) :-
    N is Size - 1,
    Col =:= N,
    Value is StartValue + Size + Row - 1, !.
spiralValue(Size, StartValue, Row, Col, Value) :-
    N is Size - 1,
    Row =:= N,
    Value is StartValue + Size * 3 - 3 - Col, !.
spiralValue(Size, StartValue, Row, Col, Value) :-
    N is Size - 2,
    M is StartValue + Size * 4 -4,
    Rr is Row - 1,
    Cc is Col - 1,
    spiralValue(N, M, Rr, Cc, Value), !.

spiral(0, []) :- !.
spiral(Size, Spiral) :-
    N is Size - 1,
    numlist(0, N, Rows),
    numlist(0, N, Cols),
    maplist([Row]>>maplist([Col]>>spiralValue(Size, 1, Row, Col),Cols), Rows, Spiral).
