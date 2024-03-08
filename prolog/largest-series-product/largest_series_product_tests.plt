pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(largest_series_product).

    test(finds_the_largest_product_if_span_equals_length, condition(true)) :-
        largest_product("29", 2, 18).

    test(can_find_the_largest_product_of_2_with_numbers_in_order, condition(true)) :-
        largest_product("0123456789", 2, 72).

    test(can_find_the_largest_product_of_2, condition(true)) :-
        largest_product("576802143", 2, 48).

    test(can_find_the_largest_product_of_3_with_numbers_in_order, condition(true)) :-
        largest_product("0123456789", 3, 504).

    test(can_find_the_largest_product_of_3, condition(true)) :-
        largest_product("1027839564", 3, 270).

    test(can_find_the_largest_product_of_5_with_numbers_in_order, condition(true)) :-
        largest_product("0123456789", 5, 15120).

    test(can_get_the_largest_product_of_a_big_number, condition(true)) :-    
        largest_product("73167176531330624919225119674426574742355349194934", 6, 23520).

    test(reports_zero_if_the_only_digits_are_zero, condition(true)) :-
        largest_product("0000", 2, 0).

    test(reports_zero_if_all_spans_include_zero, condition(true)) :-
        largest_product("99099", 3, 0).

    test(rejects_span_longer_than_string_length, [fail, condition(true)]) :-
        largest_product("123", 4, _).

    test(rejects_empty_string_and_nonzero_span, [fail, condition(true)]) :-
        largest_product("", 1, _).

    test(rejects_invalid_character_in_digits, [fail, condition(true)]) :-
        largest_product("1234a5", 2, _).

    test(rejects_negative_span, [fail, condition(true)]) :-
        largest_product("12345", -1, _).

:- end_tests(largest_series_product).
