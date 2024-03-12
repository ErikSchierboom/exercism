pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(all_your_base).

    test(single_bit_one_to_decimal, condition(true)) :-
        rebase(2, [1], 10, Rebased),
        Rebased == [1].

    test(binary_to_single_decimal, condition(true)) :-
        rebase(2, [1, 0, 1], 10, Rebased),
        Rebased == [5].

    test(single_decimal_to_binary, condition(true)) :-
        rebase(10, [5], 2, Rebased),
        Rebased == [1, 0, 1].

    test(binary_to_multiple_decimal, condition(true)) :-
        rebase(2, [1, 0, 1, 0, 1, 0], 10, Rebased),
        Rebased == [4, 2].

    test(decimal_to_binary, condition(true)) :-
        rebase(10, [4, 2], 2, Rebased),
        Rebased == [1, 0, 1, 0, 1, 0].

    test(trinary_to_hexadecimal, condition(true)) :-
        rebase(3, [1, 1, 2, 0], 16, Rebased),
        Rebased == [2, 10].

    test(hexadecimal_to_trinary, condition(true)) :-
        rebase(16, [2, 10], 3, Rebased),
        Rebased == [1, 1, 2, 0].

    test(fifteen_bit_integer, condition(true)) :-
        rebase(97, [3, 46, 60], 73, Rebased),
        Rebased == [6, 10, 45].

    test(empty_list, condition(true)) :-
        rebase(2, [], 10, Rebased),
        Rebased == [0].

    test(single_zero, condition(true)) :-
        rebase(10, [0], 2, Rebased),
        Rebased == [0].

    test(multiple_zeros, condition(true)) :-
        rebase(10, [0, 0, 0], 2, Rebased),
        Rebased == [0].

    test(leading_zeros, condition(true)) :-
        rebase(7, [0, 6, 0], 10, Rebased),
        Rebased == [4, 2].

    test(input_base_is_one, [fail, condition(true)]) :-
        rebase(1, [0], 10, _).

    test(input_base_is_zero, [fail, condition(true)]) :-
        rebase(0, [], 10, _).

    test(input_base_is_negative, [fail, condition(true)]) :-
        rebase(-2, [1], 10, _).

    test(negative_digit, [fail, condition(true)]) :-
        rebase(2, [1, -1, 1, 0, 1, 0], 10, _).

    test(invalid_positive_digit, [fail, condition(true)]) :-
        rebase(2, [1, 2, 1, 0, 1, 0], 10, _).

    test(output_base_is_one, [fail, condition(true)]) :-
        rebase(2, [1, 0, 1, 0, 1, 0], 1, _).

    test(output_base_is_zero, [fail, condition(true)]) :-
        rebase(10, [7], 0, _).

    test(output_base_is_negative, [fail, condition(true)]) :-
        rebase(2, [1], -7, _).

    test(both_bases_are_negative, [fail, condition(true)]) :-
        rebase(-2, [1], -7, _).

:- end_tests(all_your_base).
