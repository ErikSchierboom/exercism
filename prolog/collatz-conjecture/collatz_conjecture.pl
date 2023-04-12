collatz_steps(1, 0) :- !.

collatz_steps(N, Steps) :- 
    N > 1,
    (0 is mod(N, 2), M is (N / 2); M is (N * 3 + 1)),
    collatz_steps(M, MSteps),
    Steps is MSteps + 1,
    !.
