pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(series).

    test(slices_of_one_from_one, condition(true)) :-
        slices("1", 1, Slices),
        Slices == ["1"].

    test(slices_of_one_from_two, condition(pending)) :-
        slices("12", 1, Slices),
        Slices == ["1", "2"].

    test(slices_of_two, condition(pending)) :-
        slices("35", 2, Slices),
        Slices == ["35"].

    test(slices_of_two_overlap, condition(pending)) :-
        slices("9142", 2, Slices),
        Slices == ["91", "14", "42"].

    test(slices_can_include_duplicates, condition(pending)) :-
        slices("777777", 3, Slices),
        Slices == ["777", "777", "777", "777"].

    test(slices_of_a_long_series, condition(pending)) :-
        slices("918493904243", 5, Slices),
        Slices == ["91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"].

    test(slice_length_is_too_large, [fail, condition(pending)]) :-
        slices("12345", 6, _).

    test(slice_length_is_way_too_large, [fail, condition(pending)]) :-
        slices("12345", 42, _).

    test(slice_length_cannot_be_zero, [fail, condition(pending)]) :-
        slices("12345", 0, _).

    test(slice_length_cannot_be_negative, [fail, condition(pending)]) :-
        slices("123", -1, _).

    test(empty_series_is_invalid, [fail, condition(pending)]) :-
        slices("", 1, _).

:- end_tests(series).
