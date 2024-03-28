:- use_module(library(clpfd)).

square_of_sum(N, Result) :- Result #= (N * (N+1) // 2) ^ 2.
sum_of_squares(N, Result) :- Result #= (N * (N+1) * (2*N+1)) // 6.

difference(N, Result) :-
    square_of_sum(N, SquareOfSum),
    sum_of_squares(N, SumOfSquares),
    Result #= SquareOfSum - SumOfSquares.
