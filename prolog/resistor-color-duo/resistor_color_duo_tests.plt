pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(resistor_color_duo).

    test(brown_and_black, condition(true)) :-
        value(["brown", "black"], Value),
        Value == 10.

    test(blue_and_grey, condition(true)) :-
        value(["blue", "grey"], Value),
        Value == 68.

    test(yellow_and_violet, condition(true)) :-
        value(["yellow", "violet"], Value),
        Value == 47.

    test(white_and_red, condition(true)) :-
        value(["white", "red"], Value),
        Value == 92.

    test(orange_and_orange, condition(true)) :-
        value(["orange", "orange"], Value),
        Value == 33.

    test(ignore_additional_colors, condition(true)) :-
        value(["green", "brown", "orange"], Value),
        Value == 51.

    test(black_and_brown_one_digit, condition(true)) :-
        value(["black", "brown"], Value),
        Value == 1.

:- end_tests(resistor_color_duo).
