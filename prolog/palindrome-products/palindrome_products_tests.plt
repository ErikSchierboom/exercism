pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(palindrome_products).

    test(find_the_smallest_palindrome_from_single_digit_factors, condition(true)) :-
        smallest(1, 9, Value, Factors),
        Value == 1,
        Factors == [1-1].

    test(find_the_largest_palindrome_from_single_digit_factors, condition(pending)) :-
        largest(1, 9, Value, Factors),
        Value == 9,
        Factors == [1-9, 3-3].

    test(find_the_smallest_palindrome_from_double_digit_factors, condition(pending)) :-
        smallest(10, 99, Value, Factors),
        Value == 121,
        Factors == [11-11].

    test(find_the_largest_palindrome_from_double_digit_factors, condition(pending)) :-
        largest(10, 99, Value, Factors),
        Value == 9009,
        Factors == [91-99].

    test(find_the_smallest_palindrome_from_triple_digit_factors, condition(pending)) :-
        smallest(100, 999, Value, Factors),
        Value == 10201,
        Factors == [101-101].

    test(find_the_largest_palindrome_from_triple_digit_factors, condition(pending)) :-
        largest(100, 999, Value, Factors),
        Value == 906609,
        Factors == [913-993].

    test(empty_result_for_smallest_if_no_palindrome_in_the_range, [fail, condition(pending)]) :-
        smallest(1002, 1003, _, _).

    test(empty_result_for_largest_if_no_palindrome_in_the_range, [fail, condition(pending)]) :-
        largest(15, 15, _, _).

    test(error_result_for_smallest_if_min_is_more_than_max, [fail, condition(pending)]) :-
        smallest(10000, 1, _, _).

    test(error_result_for_largest_if_min_is_more_than_max, [fail, condition(pending)]) :-
        largest(2, 1, _, _).

    test(smallest_product_does_not_use_the_smallest_factor, condition(pending)) :-
        smallest(3215, 4000, Value, Factors),
        Value == 10988901,
        Factors == [3297-3333].

:- end_tests(palindrome_products).

% BONUS TESTS
bonus :-
    current_prolog_flag(argv, ['--bonus'|_]).

:- begin_tests(palindrome_products_bonus, [condition(bonus)]).

    test(find_the_smallest_palindrome_from_four_digit_factors, condition(pending)) :-
        smallest(1000, 9999, Value, Factors),
        Value == 1002001,
        Factors == [1001-1001].

    test(find_the_largest_palindrome_from_four_digit_factors, condition(pending)) :-
        largest(1000, 9999, Value, Factors),
        Value == 99000099,
        Factors == [9901-9999].

:- end_tests(palindrome_products_bonus).
