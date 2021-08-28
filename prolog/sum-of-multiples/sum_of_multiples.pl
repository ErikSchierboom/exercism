multiple([H|T], N) :- N mod H =:= 0; multiple(T, N).
multiple([], _) :- false.

sum_of_multiples(Factors, Limit, Sum) :-
    Max is Limit - 1,
    M is max(Max, 1),
    numlist(1, M, List),
    include(multiple(Factors), List, Multiples),
    sum_list(Multiples, Sum).
