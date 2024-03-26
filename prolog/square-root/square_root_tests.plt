pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(square_root).

    test(root_of_1, condition(true)) :-
        square_root(1, SquareRoot),
        SquareRoot == 1.

    test(root_of_4, condition(pending)) :-
        square_root(4, SquareRoot),
        SquareRoot == 2.

    test(root_of_25, condition(pending)) :-
        square_root(25, SquareRoot),
        SquareRoot == 5.

    test(root_of_81, condition(pending)) :-
        square_root(81, SquareRoot),
        SquareRoot == 9.

    test(root_of_196, condition(pending)) :-
        square_root(196, SquareRoot),
        SquareRoot == 14.

    test(root_of_65025, condition(pending)) :-
        square_root(65025, SquareRoot),
        SquareRoot == 255.

:- end_tests(square_root).
