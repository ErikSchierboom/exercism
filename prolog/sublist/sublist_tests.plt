pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(sublist).

    test(empty_lists, condition(true)) :-
        sublist([], [], Qualification),
        Qualification == equal.

    test(empty_list_within_non_empty_list, condition(pending)) :-
        sublist([], [1, 2, 3], Qualification),
        Qualification == sublist.

    test(non_empty_list_contains_empty_list, condition(pending)) :-
        sublist([1, 2, 3], [], Qualification),
        Qualification == superlist.

    test(list_equals_itself, condition(pending)) :-
        sublist([1, 2, 3], [1, 2, 3], Qualification),
        Qualification == equal.

    test(different_lists, condition(pending)) :-
        sublist([1, 2, 3], [2, 3, 4], Qualification),
        Qualification == unequal.

    test(false_start, condition(pending)) :-
        sublist([1, 2, 5], [0, 1, 2, 3, 1, 2, 5, 6], Qualification),
        Qualification == sublist.

    test(consecutive, condition(pending)) :-
        sublist([1, 1, 2], [0, 1, 1, 1, 2, 1, 2], Qualification),
        Qualification == sublist.

    test(sublist_at_start, condition(pending)) :-
        sublist([0, 1, 2], [0, 1, 2, 3, 4, 5], Qualification),
        Qualification == sublist.

    test(sublist_in_middle, condition(pending)) :-
        sublist([2, 3, 4], [0, 1, 2, 3, 4, 5], Qualification),
        Qualification == sublist.

    test(sublist_at_end, condition(pending)) :-
        sublist([3, 4, 5], [0, 1, 2, 3, 4, 5], Qualification),
        Qualification == sublist.

    test(at_start_of_superlist, condition(pending)) :-
        sublist([0, 1, 2, 3, 4, 5], [0, 1, 2], Qualification),
        Qualification == superlist.

    test(in_middle_of_superlist, condition(pending)) :-
        sublist([0, 1, 2, 3, 4, 5], [2, 3], Qualification),
        Qualification == superlist.

    test(at_end_of_superlist, condition(pending)) :-
        sublist([0, 1, 2, 3, 4, 5], [3, 4, 5], Qualification),
        Qualification == superlist.

    test(first_list_missing_element_from_second_list, condition(pending)) :-
        sublist([1, 3], [1, 2, 3], Qualification),
        Qualification == unequal.

    test(second_list_missing_element_from_first_list, condition(pending)) :-
        sublist([1, 2, 3], [1, 3], Qualification),
        Qualification == unequal.

    test(first_list_missing_additional_digits_from_second_list, condition(pending)) :-
        sublist([1, 2], [1, 22], Qualification),
        Qualification == unequal.

    test(order_matters_to_a_list, condition(pending)) :-
        sublist([1, 2, 3], [3, 2, 1], Qualification),
        Qualification == unequal.

    test(same_digits_but_different_numbers, condition(pending)) :-
        sublist([1, 0, 1], [10, 1], Qualification),
        Qualification == unequal.

:- end_tests(sublist).
