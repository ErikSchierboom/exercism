pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(binary_search).

    test(finds_a_value_in_a_list_with_one_element, condition(true)) :-
        List = [6],
        find(List, 6, 0).

    test(finds_a_value_in_the_middle_of_a_list, condition(true)) :-
        List = [1, 3, 4, 6, 8, 9, 11],
        find(List, 6, 3).

    test(finds_a_value_at_the_beginning_of_a_list, condition(true)) :-
        List = [1, 3, 4, 6, 8, 9, 11],
        find(List, 1, 0).

    test(finds_a_value_at_the_end_of_a_list, condition(true)) :-
        List = [1, 3, 4, 6, 8, 9, 11],
        find(List, 11, 6).

    test(finds_a_value_in_a_list_of_odd_length, condition(true)) :-
        List = [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634],
        find(List, 144, 9).

    test(finds_a_value_in_a_list_of_even_length, condition(true)) :-
        List = [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377],
        find(List, 21, 5).

    test(identifies_that_a_value_is_not_included_in_the_List, [fail, condition(true)]) :-
        List = [1, 3, 4, 6, 8, 9, 11],
        find(List, 7, -1).

    test(a_value_smaller_than_the_Lists_smallest_value_is_not_found, [fail, condition(true)]) :-
        List = [1, 3, 4, 6, 8, 9, 11],
        find(List, 0, -1).

    test(a_value_larger_than_the_Lists_largest_value_is_not_found, [fail, condition(true)]) :-
        List = [1, 3, 4, 6, 8, 9, 11],
        find(List, 13, -1).

    test(nothing_is_found_in_an_empty_List, [fail, condition(true)]) :-
        List = [],
        find(List, 1, -1).

    test(nothing_is_found_when_the_left_and_right_bounds_cross, [fail, condition(true)]) :-
        List = [1, 2],
        find(List, 0, -1).

:- end_tests(binary_search).
