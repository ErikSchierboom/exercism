pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(cheryls_birthday).

    test(cheryls_birthday, condition(true)) :-
        cheryls_birthday(Month, Day),
        Month == july,
        Day == 16.

:- end_tests(cheryls_birthday).
