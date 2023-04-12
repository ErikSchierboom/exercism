pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(flatten_array).

    test(empty, condition(true)) :-
        flatten_list([], Flattened),
        Flattened == [].

    test(no_nesting, condition(pending)) :-
        flatten_list([0, 1, 2], Flattened),
        Flattened == [0, 1, 2].

    test(flattens_a_nested_array, condition(pending)) :-
        flatten_list([[[]]], Flattened),
        Flattened == [].

    test(flattens_array_with_just_integers_present, condition(pending)) :-
        flatten_list([
            1,
            [2, 3, 4, 5, 6, 7],
            8
        ], Flattened),
        Flattened == [1, 2, 3, 4, 5, 6, 7, 8].

    test(five_level_nesting, condition(pending)) :-
        flatten_list([
            0,
            2,
            [
                [2, 3],
                8,
                100,
                4,
                [[[50]]]
            ],
            -2
        ], Flattened),
        Flattened == [0, 2, 2, 3, 8, 100, 4, 50, -2].

    test(six_level_nesting, condition(pending)) :-
        flatten_list([
            1,
            [
                2,
                [[3]],
                [4, [[5]]],
                6,
                7
            ],
            8
        ], Flattened),
        Flattened == [1, 2, 3, 4, 5, 6, 7, 8].

    test(nil_values_are_omitted_from_the_final_result, condition(pending)) :-
        flatten_list([1, 2, nil], Flattened),
        Flattened == [1, 2].

    test(consecutive_nil_values_at_the_front_of_the_list_are_omitted_from_the_final_result, condition(pending)) :-
        flatten_list([nil, nil, 3], Flattened),
        Flattened == [3].

    test(consecutive_nil_values_in_the_middle_of_the_list_are_omitted_from_the_final_result, condition(pending)) :-
        flatten_list([1, nil, nil, 4], Flattened),
        Flattened == [1, 4].

    test(six_level_nest_list_with_nil_values, condition(pending)) :-
        flatten_list([
            0,
            2,
            [
                [2, 3],
                8,
                [[100]],
                nil,
                [[nil]]
            ],
            -2
        ], Flattened),
        Flattened == [0, 2, 2, 3, 8, 100, -2].

    test(all_values_in_nested_list_are_nil, condition(pending)) :-
        flatten_list([
            nil,
            [[[nil]]],
            nil,
            nil,
            [[nil, nil], nil],
            nil
        ], Flattened),
        Flattened == [].

:- end_tests(flatten_array).
