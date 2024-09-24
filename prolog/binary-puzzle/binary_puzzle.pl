:- use_module(library(clpfd)).

binary_puzzle(Rows) :-
    length(Rows, Dimension),
    transpose(Rows, Cols),
    maplist(same_length(Rows), Rows),
    maplist(max_two_identical_consecutive_numbers, Rows),
    maplist(max_two_identical_consecutive_numbers, Cols),    
    maplist(binary_digits, Cols, ColsAsIntegers),
    maplist(binary_digits, Rows, RowsAsIntegers),
    all_different(RowsAsIntegers),
    all_different(ColsAsIntegers),
    Half #= Dimension // 2,
    maplist(zeros_and_ones_have_same_count(Half), Rows),
    maplist(zeros_and_ones_have_same_count(Half), Cols).

binary_digits(Digits, Decimal) :- 
    Digits ins 0..1,
    foldl([Digit,Acc,NewAcc]>>(NewAcc #= Acc << 1 + Digit), Digits, 0, Decimal).

zeros_and_ones_have_same_count(Count, Digits) :-
    global_cardinality(Digits, [0-Count, 1-Count]).

max_two_identical_consecutive_numbers([_, _]).
max_two_identical_consecutive_numbers([X, Y, Z | Rest]) :-
    X #= Y #==> Y #\= Z,
    Y #= Z #==> X #\= Z,
    max_two_identical_consecutive_numbers([Y, Z | Rest]).
