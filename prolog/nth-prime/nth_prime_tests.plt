pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(nth_prime).

    test(first_prime, condition(true)) :-
        nth_prime(1, Prime),
        Prime == 2.

    test(second_prime, condition(pending)) :-
        nth_prime(2, Prime),
        Prime == 3.

    test(sixth_prime, condition(pending)) :-
        nth_prime(6, Prime),
        Prime == 13.

    test(big_prime, condition(pending)) :-
        nth_prime(10001, Prime),
        Prime == 104743.

    test(there_is_no_zeroth_prime, [fail, condition(pending)]) :-
        nth_prime(0, _).

:- end_tests(nth_prime).
