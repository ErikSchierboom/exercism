:- use_module(library(clpfd)).

square_root(Number, Current, SquareRoot) :-
    Current ^ 2 #\= Number,
    Next #= Current + 1,
    square_root(Number, Next, SquareRoot), !.

square_root(_, Current, Current).

square_root(Number, SquareRoot) :- square_root(Number, 0, SquareRoot).
