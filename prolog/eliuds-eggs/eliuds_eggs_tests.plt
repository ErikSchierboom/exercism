pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(eliuds_eggs).

    test(zero_eggs, condition(true)) :-
        egg_count(0, 0).

    test(one_egg, condition(true)) :-
        egg_count(16, 1).

    test(four_eggs, condition(true)) :-
        egg_count(89, 4).

    test(thirteen_eggs, condition(true)) :-
        egg_count(2000000000, 13).

:- end_tests(eliuds_eggs).
