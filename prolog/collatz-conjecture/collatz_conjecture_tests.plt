pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(collatz_conjecture).

    test(zero_steps_for_one, condition(true)) :-
        collatz_steps(1, Steps), Steps == 0.

    test(divide_if_even, condition(true)) :-
        collatz_steps(16, Steps), Steps == 4.

    test(even_and_odd_steps, condition(true)) :-
        collatz_steps(12, Steps), Steps == 9.

    test(large_number_of_even_and_odd_steps, condition(true)) :-
        collatz_steps(1_000_000, Steps), Steps == 152.

    test(zero_is_an_error, [fail, condition(true)]) :-
        collatz_steps(0, _).

    test(negative_value_is_an_error, [fail, condition(true)]) :-
        collatz_steps(-1, _).

:- end_tests(collatz_conjecture).
