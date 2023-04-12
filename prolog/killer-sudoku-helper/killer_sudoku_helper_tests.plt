pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(killer_sudoku_helper).

    test(trivial_1_digit_cages_1, condition(true)) :-
        combinations(1, 1, [], Combinations),
        Combinations == [[1]].

    test(trivial_1_digit_cages_2, condition(pending)) :-
        combinations(1, 2, [], Combinations),
        Combinations == [[2]].

    test(trivial_1_digit_cages_3, condition(pending)) :-
        combinations(1, 3, [], Combinations),
        Combinations == [[3]].

    test(trivial_1_digit_cages_4, condition(pending)) :-
        combinations(1, 4, [], Combinations),
        Combinations == [[4]].

    test(trivial_1_digit_cages_5, condition(pending)) :-
        combinations(1, 5, [], Combinations),
        Combinations == [[5]].

    test(trivial_1_digit_cages_6, condition(pending)) :-
        combinations(1, 6, [], Combinations),
        Combinations == [[6]].

    test(trivial_1_digit_cages_7, condition(pending)) :-
        combinations(1, 7, [], Combinations),
        Combinations == [[7]].

    test(trivial_1_digit_cages_8, condition(pending)) :-
        combinations(1, 8, [], Combinations),
        Combinations == [[8]].

    test(trivial_1_digit_cages_9, condition(pending)) :-
        combinations(1, 9, [], Combinations),
        Combinations == [[9]].

    test(cage_with_sum_45_contains_all_digits_1_9, condition(pending)) :-
        combinations(9, 45, [], Combinations),
        Combinations == [[1, 2, 3, 4, 5, 6, 7, 8, 9]].

    test(cage_with_only_1_possible_combination, condition(pending)) :-
        combinations(3, 7, [], Combinations),
        Combinations == [[1, 2, 4]].

    test(cage_with_several_combinations, condition(pending)) :-
        combinations(2, 10, [], Combinations),
        Combinations == [[1, 9], [2, 8], [3, 7], [4, 6]].

    test(cage_with_several_combinations_that_is_restricted, condition(pending)) :-
        combinations(2, 10, [1, 4], Combinations),
        Combinations == [[2, 8], [3, 7]].

:- end_tests(killer_sudoku_helper).
