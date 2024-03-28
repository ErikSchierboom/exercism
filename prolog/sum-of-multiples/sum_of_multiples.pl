multiple(Factors, N) :- member(Factor, Factors), N mod Factor =:= 0, !.

sum_of_multiples(Factors, Limit, Sum) :-
    Max is Limit - 1,
    aggregate(sum(N), N^(between(1, Max, N), multiple(Factors, N)), Sum), !.
sum_of_multiples(_, _, 0).
