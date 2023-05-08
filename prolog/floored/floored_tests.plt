pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(floored).

    test(floor_amara, condition(true)) :-
        floor(amara, Floor),
        Floor == 3.

    test(floor_bjorn, condition(pending)) :-
        floor(bjorn, Floor),
        Floor == 2.

    test(floor_cora, condition(pending)) :-
        floor(cora, Floor),
        Floor == 4.

    test(floor_dale, condition(pending)) :-
        floor(dale, Floor),
        Floor == 5.

    test(floor_emiko, condition(pending)) :-
        floor(emiko, Floor),
        Floor == 1.

:- end_tests(floored).
