pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(custom_set).

    test(sets_with_no_elements_are_empty, condition(true)) :-
        create_set(Sut),
        is_empty(Sut).

    test(sets_with_elements_are_not_empty, [fail, condition(pending)]) :-
        create_set([1], Sut),
        is_empty(Sut).

    test(nothing_is_contained_in_an_empty_set, [fail, condition(pending)]) :-
        create_set(Sut),
        in_set(1, Sut).

    test(when_the_element_is_in_the_set, condition(pending)) :-
        create_set([1, 2, 3], Sut),
        in_set(1, Sut).

    test(when_the_element_is_not_in_the_set, [fail, condition(pending)]) :-
        create_set([1, 2, 3], Sut),
        in_set(4, Sut).

    test(empty_set_is_a_subset_of_another_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set(Set2),
        is_subset(Set1, Set2).

    test(empty_set_is_a_subset_of_non_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set([1], Set2),
        is_subset(Set1, Set2).

    test(non_empty_set_is_not_a_subset_of_empty_set, [fail, condition(pending)]) :-
        create_set([1], Set1),
        create_set(Set2),
        is_subset(Set1, Set2).

    test(set_is_a_subset_of_set_with_exact_same_elements, condition(pending)) :-
        create_set([1, 2, 3], Set1),
        create_set([1, 2, 3], Set2),
        is_subset(Set1, Set2).

    test(set_is_a_subset_of_larger_set_with_same_elements, condition(pending)) :-
        create_set([1, 2, 3], Set1),
        create_set([4, 1, 2, 3], Set2),
        is_subset(Set1, Set2).

    test(set_is_not_a_subset_of_set_that_does_not_contain_its_elements, [fail, condition(pending)]) :-
        create_set([1, 2, 3], Set1),
        create_set([4, 1, 3], Set2),
        is_subset(Set1, Set2).

    test(the_empty_set_is_disjoint_with_itself, condition(pending)) :-
        create_set(Set1),
        create_set(Set2),
        is_disjoint(Set1, Set2).

    test(empty_set_is_disjoint_with_non_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set([1], Set2),
        is_disjoint(Set1, Set2).

    test(non_empty_set_is_disjoint_with_empty_set, condition(pending)) :-
        create_set([1], Set1),
        create_set(Set2),
        is_disjoint(Set1, Set2).

    test(sets_are_not_disjoint_if_they_share_an_element, [fail, condition(pending)]) :-
        create_set([1, 2], Set1),
        create_set([2, 3], Set2),
        is_disjoint(Set1, Set2).

    test(sets_are_disjoint_if_they_share_no_elements, condition(pending)) :-
        create_set([1, 2], Set1),
        create_set([3, 4], Set2),
        is_disjoint(Set1, Set2).

    test(empty_sets_are_equal, condition(pending)) :-
        create_set(Set1),
        create_set(Set2),
        Set1 == Set2.

    test(empty_set_is_not_equal_to_non_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set([1, 2, 3], Set2),
        Set1 \== Set2.

    test(non_empty_set_is_not_equal_to_empty_set, condition(pending)) :-
        create_set([1, 2, 3], Set1),
        create_set(Set2),
        Set1 \== Set2.

    test(sets_with_the_same_elements_are_equal, condition(pending)) :-
        create_set([1, 2], Set1),
        create_set([2, 1], Set2),
        Set1 == Set2.

    test(sets_with_different_elements_are_not_equal, condition(pending)) :-
        create_set([1, 2, 3], Set1),
        create_set([1, 2, 4], Set2),
        Set1 \== Set2.

    test(set_is_not_equal_to_larger_set_with_same_elements, condition(pending)) :-
        create_set([1, 2, 3], Set1),
        create_set([1, 2, 3, 4], Set2),
        Set1 \== Set2.

    test(set_is_equal_to_a_set_constructed_from_an_array_with_duplicates, condition(pending)) :-
        create_set([1], Set1),
        create_set([1, 1], Set2),
        Set1 == Set2.

    test(add_to_empty_set, condition(pending)) :-
        create_set(Sut),
        add(3, Sut, NewSut),
        create_set([3], Expected),
        NewSut == Expected.

    test(add_to_non_empty_set, condition(pending)) :-
        create_set([1, 2, 4], Sut),
        add(3, Sut, NewSut),
        create_set([1, 2, 3, 4], Expected),
        NewSut == Expected.

    test(adding_an_existing_element_does_not_change_the_set, condition(pending)) :-
        create_set([1, 2, 3], Sut),    
        add(3, Sut, NewSut),
        create_set([1, 2, 3], Expected),
        NewSut == Expected.

    test(intersection_of_two_empty_sets_is_an_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set(Set2),
        intersection(Set1, Set2, Intersection),
        create_set(Expected),
        Intersection == Expected.

    test(intersection_of_an_empty_set_and_non_empty_set_is_an_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set([3, 2, 5], Set2),
        intersection(Set1, Set2, Intersection),
        create_set(Expected),
        Intersection == Expected.

    test(intersection_of_a_non_empty_set_and_an_empty_set_is_an_empty_set, condition(pending)) :-
        create_set([1, 2, 3, 4], Set1),
        create_set(Set2),
        intersection(Set1, Set2, Intersection),
        create_set(Expected),
        Intersection == Expected.

    test(intersection_of_two_sets_with_no_shared_elements_is_an_empty_set, condition(pending)) :-
        create_set([1, 2, 3], Set1),
        create_set([4, 5, 6], Set2),
        intersection(Set1, Set2, Intersection),
        create_set(Expected),
        Intersection == Expected.

    test(intersection_of_two_sets_with_shared_elements_is_a_set_of_the_shared_elements, condition(pending)) :-
        create_set([1, 2, 3, 4], Set1),
        create_set([3, 2, 5], Set2),
        intersection(Set1, Set2, Intersection),
        create_set([2, 3], Expected),
        Intersection == Expected.

    test(difference_of_two_empty_sets_is_an_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set(Set2),
        difference(Set1, Set2, Difference),
        create_set(Expected),
        Difference == Expected.

    test(difference_of_empty_set_and_non_empty_set_is_an_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set([3, 2, 5], Set2),
        difference(Set1, Set2, Difference),
        create_set(Expected),
        Difference == Expected.

    test(difference_of_a_non_empty_set_and_an_empty_set_is_the_non_empty_set, condition(pending)) :-
        create_set([1, 2, 3, 4], Set1),
        create_set(Set2),
        difference(Set1, Set2, Difference),
        create_set([1, 2, 3, 4], Expected),
        Difference == Expected.

    test(difference_of_two_non_empty_sets_is_a_set_of_elements_that_are_only_in_the_first_set, condition(pending)) :-
        create_set([3, 2, 1], Set1),
        create_set([2, 4], Set2),
        difference(Set1, Set2, Difference),
        create_set([1, 3], Expected),
        Difference == Expected.

    test(union_of_empty_sets_is_an_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set(Set2),
        union(Set1, Set2, Union),
        create_set(Expected),
        Union == Expected.

    test(union_of_an_empty_set_and_non_empty_set_is_the_non_empty_set, condition(pending)) :-
        create_set(Set1),
        create_set([2], Set2),
        union(Set1, Set2, Union),
        create_set([2], Expected),
        Union == Expected.

    test(union_of_a_non_empty_set_and_empty_set_is_the_non_empty_set, condition(pending)) :-
        create_set([1, 3], Set1),
        create_set(Set2),
        union(Set1, Set2, Union),
        create_set([1, 3], Expected),
        Union == Expected.

    test(union_of_non_empty_sets_contains_all_unique_elements, condition(pending)) :-
        create_set([1, 3], Set1),
        create_set([2, 3], Set2),
        union(Set1, Set2, Union),
        create_set([1, 2, 3], Expected),
        Union == Expected.

:- end_tests(custom_set).
