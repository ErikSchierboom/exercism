pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(phone_number).

    test(cleans_the_number, condition(true)) :-
        cleanup("(223) 456-7890", Cleaned),
        Cleaned == "2234567890".

    test(cleans_numbers_with_dots, condition(true)) :-
        cleanup("223.456.7890", Cleaned),
        Cleaned == "2234567890".

    test(cleans_numbers_with_multiple_spaces, condition(true)) :-
        cleanup("223 456   7890   ", Cleaned),
        Cleaned == "2234567890".

    test(invalid_when_9_digits, [fail, condition(true)]) :-
        cleanup("123456789", _).

    test(invalid_when_11_digits_does_not_start_with_a_1, [fail, condition(true)]) :-
        cleanup("22234567890", _).

    test(valid_when_11_digits_and_starting_with_1, condition(true)) :-
        cleanup("12234567890", Cleaned),
        Cleaned == "2234567890".

    test(valid_when_11_digits_and_starting_with_1_even_with_punctuation, condition(true)) :-
        cleanup("+1 (223) 456-7890", Cleaned),
        Cleaned == "2234567890".

    test(invalid_when_more_than_11_digits, [fail, condition(true)]) :-
        cleanup("321234567890", _).

    test(invalid_with_letters, [fail, condition(true)]) :-
        cleanup("523-abc-7890", _).

    test(invalid_with_punctuations, [fail, condition(true)]) :-
        cleanup("523-@:!-7890", _).

    test(invalid_if_area_code_starts_with_0, [fail, condition(true)]) :-
        cleanup("(023) 456-7890", _).

    test(invalid_if_area_code_starts_with_1, [fail, condition(true)]) :-
        cleanup("(123) 456-7890", _).

    test(invalid_if_exchange_code_starts_with_0, [fail, condition(true)]) :-
        cleanup("(223) 056-7890", _).

    test(invalid_if_exchange_code_starts_with_1, [fail, condition(true)]) :-
        cleanup("(223) 156-7890", _).

    test(invalid_if_area_code_starts_with_0_on_valid_11_digit_number, [fail, condition(true)]) :-
        cleanup("1 (023) 456-7890", _).

    test(invalid_if_area_code_starts_with_1_on_valid_11_digit_number, [fail, condition(true)]) :-
        cleanup("1 (123) 456-7890", _).

    test(invalid_if_exchange_code_starts_with_0_on_valid_11_digit_number, [fail, condition(true)]) :-
        cleanup("1 (223) 056-7890", _).

    test(invalid_if_exchange_code_starts_with_1_on_valid_11_digit_number, [fail, condition(true)]) :-
        cleanup("1 (223) 156-7890", _).

:- end_tests(phone_number).
