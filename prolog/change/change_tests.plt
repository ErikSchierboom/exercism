pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(change).

    test(change_for_1_cent, condition(true)) :-
        fewest_coins([1, 5, 10, 25], 1, Change),
        Change == [1].

    test(single_coin_change, condition(pending)) :-
        fewest_coins([1, 5, 10, 25, 100], 25, Change),
        Change == [25].

    test(multiple_coin_change, condition(pending)) :-
        fewest_coins([1, 5, 10, 25, 100], 15, Change),
        Change == [5, 10].

    test(change_with_lilliputian_coins, condition(pending)) :-
        fewest_coins([1, 4, 15, 20, 50], 23, Change),
        Change == [4, 4, 15].

    test(change_with_lower_elbonia_coins, condition(pending)) :-
        fewest_coins([1, 5, 10, 21, 25], 63, Change),
        Change == [21, 21, 21].

    test(large_target_values, condition(pending)) :-
        fewest_coins([1, 2, 5, 10, 20, 50, 100], 999, Change),
        Change == [2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100].

    test(possible_change_without_unit_coins_available, condition(pending)) :-
        fewest_coins([2, 5, 10, 20, 50], 21, Change),
        Change == [2, 2, 2, 5, 10].

    test(another_possible_change_without_unit_coins_available, condition(pending)) :-
        fewest_coins([4, 5], 27, Change),
        Change == [4, 4, 4, 5, 5, 5].

    test(no_coins_make_0_change, condition(pending)) :-
        fewest_coins([1, 5, 10, 21, 25], 0, Change),
        Change == [].

    test(error_testing_for_change_smaller_than_the_smallest_of_coins, [fail, condition(pending)]) :-
        fewest_coins([5, 10], 3, _).

    test(error_if_no_combination_can_add_up_to_target, [fail, condition(pending)]) :-
        fewest_coins([5, 10], 94, _).

    test(cannot_find_negative_change_values, [fail, condition(pending)]) :-
        fewest_coins([1, 2, 5], -5, _).

:- end_tests(change).
