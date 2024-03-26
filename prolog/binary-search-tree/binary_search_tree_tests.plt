pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(binary_search_tree).

    test(data_is_retained, condition(true)) :-
        from_data([4], Tree),
        Tree == tree_node(4, nil, nil).

    test(smaller_number_at_left_node, condition(pending)) :-
        from_data([4, 2], Tree),
        Tree == tree_node(4, tree_node(2, nil, nil), nil).

    test(same_number_at_left_node, condition(pending)) :-
        from_data([4, 4], Tree),
        Tree == tree_node(4, tree_node(4, nil, nil), nil).

    test(greater_number_at_right_node, condition(pending)) :-
        from_data([4, 5], Tree),
        Tree == tree_node(4, nil, tree_node(5, nil, nil)).

    test(can_create_complex_tree, condition(pending)) :-
        from_data([4, 2, 6, 1, 3, 5, 7], Tree),
        Tree == tree_node(
            4,
            tree_node(2, tree_node(1, nil, nil), tree_node(3, nil, nil)),
            tree_node(6, tree_node(5, nil, nil), tree_node(7, nil, nil))
        ).

    test(can_sort_single_number, condition(pending)) :-
        from_data([2], Tree),
        to_data(Tree, Data),
        Data == [2].

    test(can_sort_if_second_number_is_smaller_than_first, condition(pending)) :-
        from_data([2, 1], Tree),
        to_data(Tree, Data),
        Data == [1, 2].

    test(can_sort_if_second_number_is_same_as_first, condition(pending)) :-
        from_data([2, 2], Tree),
        to_data(Tree, Data),
        Data == [2, 2].

    test(can_sort_if_second_number_is_greater_than_first, condition(pending)) :-
        from_data([2, 3], Tree),
        to_data(Tree, Data),
        Data == [2, 3].

    test(can_sort_complex_tree, condition(pending)) :-
        from_data([2, 1, 3, 6, 7, 5], Tree),
        to_data(Tree, Data),
        Data == [1, 2, 3, 5, 6, 7].

:- end_tests(binary_search_tree).
