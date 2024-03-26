prime(2) :- !.
prime(3) :- !.
prime(P) :- P > 3, P mod 2 =\= 0, prime(P, 3), !.
prime(P, N) :- (N*N > P -> true; P mod N =\= 0, M is N + 2, prime(P, M)), !.

next_prime(N, N):- prime(N), !.
next_prime(N, Prime):- NextN is N + 1, next_prime(NextN, Prime).

nth_prime(1, 2) :- !.
nth_prime(2, 3) :- !.
nth_prime(N, Prime):-
    N > 2,
    PrevN is N - 1,
    nth_prime(PrevN, PrevPrime),
    NextN is PrevPrime + 1,
    next_prime(NextN, Prime).
