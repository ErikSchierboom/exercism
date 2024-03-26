pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(resistor_color).

    test(black, condition(true)) :-
        color_code("black", Code), 
        Code == 0.

    test(white, condition(pending)) :-
        color_code("white", Code), 
        Code == 9.

    test(orange, condition(pending)) :-
        color_code("orange", Code), 
        Code == 3.

    test(colors, condition(pending)) :-
        colors(Colors),
        Colors == [
            "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white"
        ].

:- end_tests(resistor_color).
