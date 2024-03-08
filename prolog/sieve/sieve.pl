:- use_module(library(clpfd)).

primes(Limit, []) :- Limit #< 2, !.
primes(Limit, Primes) :-
    numlist(2, Limit, Sieve),
    Stop is round(sqrt(Limit)),
    primes(Stop, Sieve, Primes).

primes(Stop, [N|Sieve], [N|Primes]):-
  exclude(is_multiple(N), Sieve, Sieved),
  (N #=< Stop -> primes(Stop, Sieved, Primes) ; Primes=Sieved).
  
is_multiple(X, Y) :- Y mod X #= 0.
