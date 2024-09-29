pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(resistor_color_trio).

    test(orange_and_orange_and_black, condition(true)) :-
        label(["orange", "orange", "black"], Label),
        Label == "33 ohms".

    test(blue_and_grey_and_brown, condition(true)) :-
        label(["blue", "grey", "brown"], Label),
        Label == "680 ohms".

    test(red_and_black_and_red, condition(true)) :-
        label(["red", "black", "red"], Label),
        Label == "2 kiloohms".

    test(green_and_brown_and_orange, condition(true)) :-
        label(["green", "brown", "orange"], Label),
        Label == "51 kiloohms".

    test(yellow_and_violet_and_yellow, condition(true)) :-
        label(["yellow", "violet", "yellow"], Label),
        Label == "470 kiloohms".

    test(blue_and_violet_and_blue, condition(true)) :-
        label(["blue", "violet", "blue"], Label),
        Label == "67 megaohms".

    test(minimum_possible_value, condition(true)) :-
        label(["black", "black", "black"], Label),
        Label == "0 ohms".

    test(maximum_possible_value, condition(true)) :-
        label(["white", "white", "white"], Label),
        Label == "99 gigaohms".

    test(first_two_colors_make_an_invalid_octal_number, condition(true)) :-
        label(["black", "grey", "black"], Label),
        Label == "8 ohms".

    test(ignore_extra_colors, condition(true)) :-
        label(["blue", "green", "yellow", "orange"], Label),
        Label == "650 kiloohms".

:- end_tests(resistor_color_trio).
