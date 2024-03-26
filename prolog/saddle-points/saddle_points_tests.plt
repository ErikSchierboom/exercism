pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(saddle_points).

    test(can_identify_single_saddle_point, condition(true)) :-
        Matrix = [[9, 8, 7], [5, 3, 2], [6, 6, 7]],
        saddle_points(Matrix, SaddlePoints),
        sort(SaddlePoints, SortedSaddlePoints),
        SortedSaddlePoints == [(1, 2)].

    test(can_identify_that_empty_matrix_has_no_saddle_points, condition(pending)) :-
        Matrix = [],
        saddle_points(Matrix, SaddlePoints),
        SaddlePoints == [].

    test(can_identify_lack_of_saddle_points_when_there_are_none, condition(pending)) :-
        Matrix = [[1, 2, 3], [3, 1, 2], [2, 3, 1]],
        saddle_points(Matrix, SaddlePoints),
        SaddlePoints == [].

    test(can_identify_multiple_saddle_points_in_a_column, condition(pending)) :-
        Matrix = [[4, 5, 4], [3, 5, 5], [1, 5, 4]],
        saddle_points(Matrix, SaddlePoints),
        sort(SaddlePoints, SortedSaddlePoints),
        SortedSaddlePoints == [(2, 1), (2, 2), (2, 3)].

    test(can_identify_multiple_saddle_points_in_a_row, condition(pending)) :-
        Matrix = [[6, 7, 8], [5, 5, 5], [7, 5, 6]],
        saddle_points(Matrix, SaddlePoints),
        sort(SaddlePoints, SortedSaddlePoints),
        SortedSaddlePoints == [(1, 2), (2, 2), (3, 2)].

    test(can_identify_saddle_point_in_bottom_right_corner, condition(pending)) :-
        Matrix = [[8, 7, 9], [6, 7, 6], [3, 2, 5]],
        saddle_points(Matrix, SaddlePoints),
        SaddlePoints == [(3, 3)].

    test(can_identify_saddle_points_in_a_non_square_matrix, condition(pending)) :-
        Matrix = [[3, 1, 3], [3, 2, 4]],
        saddle_points(Matrix, SaddlePoints),
        sort(SaddlePoints, SortedSaddlePoints),
        SortedSaddlePoints == [(1, 1), (3, 1)].

    test(can_identify_that_saddle_points_in_a_single_column_matrix_are_those_with_the_minimum_value, condition(pending)) :-
        Matrix = [[2], [1], [4], [1]],
        saddle_points(Matrix, SaddlePoints),
        sort(SaddlePoints, SortedSaddlePoints),
        SortedSaddlePoints == [(1, 2), (1, 4)].

    test(can_identify_that_saddle_points_in_a_single_row_matrix_are_those_with_the_maximum_value, condition(pending)) :-
        Matrix = [[2, 5, 3, 5]],
        saddle_points(Matrix, SaddlePoints),
        sort(SaddlePoints, SortedSaddlePoints),
        SortedSaddlePoints == [(2, 1), (4, 1)].

:- end_tests(saddle_points).
