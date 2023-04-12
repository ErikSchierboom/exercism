combination(1, [H|_], [H]).
combination(N, [H|T], [H|C]) :-
    N1 is N - 1,
    N1 > 0,
    combination(N1, T, C).
combination(N, [_|T], C) :- combination(N, T, C).

combination_with_sum(Size, Sum, Digits, Combination) :-
    combination(Size, Digits, Combination),
    sum_list(Combination, Sum).

combinations(Size, Sum, Exclude, Combinations) :-
    subtract([1,2,3,4,5,6,7,8,9], Exclude, RemainingDigits),
    findall(Combination, combination_with_sum(Size, Sum, RemainingDigits, Combination), Combinations).
