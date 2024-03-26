pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(robot_name).

    test(has_name, condition(true)) :-
        create_robot(Robot),
        robot_name(Robot, Name),
        string_concat(Letters, Digits, Name),
        string_length(Letters, 2),
        string_length(Digits, 3),
        string_chars(Letters, LettersChars),
        string_chars(Digits, DigitsChars),
        maplist([C]>>char_type(C, upper), LettersChars),
        maplist([C]>>char_type(C, digit), DigitsChars),
        !.

    test(name_sticks, condition(pending)) :-
        create_robot(Robot),
        robot_name(Robot, Name1),
        robot_name(Robot, Name2),
        Name1 == Name2.

    test(different_robots_have_different_names, condition(pending)) :-
        create_robot(Robot1),
        create_robot(Robot2),
        robot_name(Robot1, Name1),
        robot_name(Robot2, Name2),
        Name1 \== Name2.

    test(reset_name, condition(pending)) :-
        create_robot(Robot),
        robot_name(Robot, Name1),
        reset_name(Robot),
        robot_name(Robot, Name2),
        Name1 \== Name2.

:- end_tests(robot_name).
