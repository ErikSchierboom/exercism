pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(prime_factors).

    test(no_factors, condition(true)) :-
        factors(1, Factors),
        Factors == [].

    test(prime_number, condition(pending)) :-
        factors(2, Factors),
        Factors == [2].

    test(another_prime_number, condition(pending)) :-
        factors(3, Factors),
        Factors == [3].

    test(square_of_a_prime, condition(pending)) :-
        factors(9, Factors),
        Factors == [3, 3].

    test(product_of_first_prime, condition(pending)) :-
        factors(4, Factors),
        Factors == [2, 2].

    test(cube_of_a_prime, condition(pending)) :-
        factors(8, Factors),
        Factors == [2, 2, 2].

    test(product_of_second_prime, condition(pending)) :-
        factors(27, Factors),
        Factors == [3, 3, 3].

    test(product_of_third_prime, condition(pending)) :-
        factors(625, Factors),
        Factors == [5, 5, 5, 5].

    test(product_of_first_and_second_prime, condition(pending)) :-
        factors(6, Factors),
        Factors == [2, 3].

    test(product_of_primes_and_non_primes, condition(pending)) :-
        factors(12, Factors),
        Factors == [2, 2, 3].

    test(product_of_primes, condition(pending)) :-
        factors(901255, Factors),
        Factors == [5, 17, 23, 461].

    test(factors_include_a_large_prime, condition(pending)) :-
        factors(93819012551, Factors),
        Factors == [11, 9539, 894119].

:- end_tests(prime_factors).
