:- use_module(library(clpfd)).

square_of_sum(N, Result) :-
    Sum #= N * (N + 1) div 2,
    Result #= Sum * Sum.

sum_of_squares(N, Result) :-
    Result #= (N * (N + 1) * (2 * N + 1)) div 6.

difference(N, Result) :-
    square_of_sum(N, SquareOfSum),
    sum_of_squares(N, SumOfSquares),
    Result #= SquareOfSum - SumOfSquares.
