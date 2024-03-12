pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(list_ops).

test(length_empty_list, condition(true)) :-
    custom_length([], Length),
    Length == 0.

test(length_non_empty_list, condition(true)) :-
    custom_length([1, 2, 3, 4], Length),
    Length == 4.

test(append_empty_lists, condition(true)) :-
    custom_append([], [], Appended),
    Appended == [].

test(append_list_to_empty_list, condition(true)) :-
    custom_append([], [1, 2, 3, 4], Appended),
    Appended == [1, 2, 3, 4].

test(append_empty_list_to_list, condition(true)) :-
    custom_append([1, 2, 3, 4], [], Appended),
    Appended == [1, 2, 3, 4].

test(append_non_empty_lists, condition(true)) :-
    custom_append([1, 2], [2, 3, 4, 5], Appended),
    Appended == [1, 2, 2, 3, 4, 5].

test(concat_empty_list, condition(true)) :-
    custom_concat([], Concatenated),
    Concatenated == [].

test(concat_list_of_lists, condition(true)) :-
    custom_concat([[1, 2], [3], [], [4, 5, 6]], Concatenated),
    Concatenated == [1, 2, 3, 4, 5, 6].

test(concat_list_of_nested_lists, condition(true)) :-
    custom_concat([[[1], [2]], [[3]], [[]], [[4, 5, 6]]], Concatenated),
    Concatenated == [[1], [2], [3], [], [4, 5, 6]].

test(map_empty_list, condition(true)) :-
    custom_map([X, Y]>>(Y is X + 1), [], Mapped),
    Mapped == [].

test(map_non_empty_list, condition(true)) :-
    custom_map([X, Y]>>(Y is X + 1), [1, 3, 5, 7], Mapped),
    Mapped == [2, 4, 6, 8].

test(filter_empty_list, condition(true)) :-
    custom_filter([X]>>(X mod 2 =:= 1), [], Filtered),
    Filtered == [].

test(filter_non_empty_list, condition(true)) :-
    custom_filter([X]>>(X mod 2 =:= 1), [1, 2, 3, 5], Filtered),
    Filtered == [1, 3, 5].

test(reverse_empty_list, condition(true)) :-
    custom_reverse([], Reversed), 
    Reversed == [].

test(reverse_non_empty_list, condition(true)) :-
    custom_reverse([1, 3, 5, 7], Reversed), 
    Reversed == [7, 5, 3, 1].

test(reverse_list_of_lists_is_not_flattened, condition(true)) :-
    custom_reverse([[1, 2], [3], [], [4, 5, 6]], Reversed),
    Reversed == [[4, 5, 6], [], [3], [1, 2]].

test(foldl_empty_list, condition(true)) :-
    custom_foldl([Acc,El,Result]>>(Result is El * Acc), 2, [], Folded),
    Folded == 2.

test(foldl_direction_independent_function_applied_to_non_empty_list, condition(true)) :-
    custom_foldl([Acc,El,Result]>>(Result is El + Acc), 5, [1, 2, 3, 4], Folded),
    Folded == 15.

test(foldl_direction_dependent_function_applied_to_non_empty_list, condition(true)) :-
    custom_foldl([Acc,El,Result]>>(Result is El / Acc), 24, [1, 2, 3, 4], Folded),
    Folded == 64.0.

test(foldr_empty_list, condition(true)) :-
    custom_foldr([El,Acc,Result]>>(Result is El * Acc), [], 2, Folded),
    Folded == 2.

test(foldr_direction_independent_function_applied_to_non_empty_list, condition(true)) :-
    custom_foldr([El,Acc,Result]>>(Result is El + Acc), [1, 2, 3, 4], 5, Folded),
    Folded == 15.

test(foldr_direction_dependent_function_applied_to_non_empty_list, condition(true)) :-
    custom_foldr([El,Acc,Result]>>(Result is El / Acc), [1, 2, 3, 4], 24, Folded),
    Folded == 9.0.

:- end_tests(list_ops).
