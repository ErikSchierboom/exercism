cell(I,J,Acc,Cell) :- Cell is Acc * (I - J) / J.

row(1, [1]) :- !.
row(I, Row) :-
    N is I - 1,
    numlist(1, N, Indices),
    scanl(cell(I), Indices, 1, Row).

pascal(0, []) :-  !.
pascal(N, Rows) :-
    numlist(1, N, Ns),
    maplist(row, Ns, Rows).
