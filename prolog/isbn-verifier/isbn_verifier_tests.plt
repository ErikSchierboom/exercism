pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(isbn_verifier).

    test(valid_isbn, condition(true)) :-
        isbn("3-598-21508-8").

    test(invalid_isbn_check_digit, [fail, condition(pending)]) :-
        isbn("3-598-21508-9").

    test(valid_isbn_with_a_check_digit_of_10, condition(pending)) :-
        isbn("3-598-21507-X").

    test(check_digit_is_a_character_other_than_x, [fail, condition(pending)]) :-
        isbn("3-598-21507-A").

    test(invalid_check_digit_in_isbn_is_not_treated_as_zero, [fail, condition(pending)]) :-
        isbn("4-598-21507-B").

    test(invalid_character_in_isbn_is_not_treated_as_zero, [fail, condition(pending)]) :-
        isbn("3-598-P1581-X").

    test(x_is_only_valid_as_a_check_digit, [fail, condition(pending)]) :-
        isbn("3-598-2X507-9").

    test(valid_isbn_without_separating_dashes, condition(pending)) :-
        isbn("3598215088").

    test(isbn_without_separating_dashes_and_x_as_check_digit, condition(pending)) :-
        isbn("359821507X").

    test(isbn_without_check_digit_and_dashes, [fail, condition(pending)]) :-
        isbn("359821507").

    test(too_long_isbn_and_no_dashes, [fail, condition(pending)]) :-
        isbn("3598215078X").

    test(too_short_isbn, [fail, condition(pending)]) :-
        isbn("00").

    test(isbn_without_check_digit, [fail, condition(pending)]) :-
        isbn("3-598-21507").

    test(check_digit_of_x_should_not_be_used_for_0, [fail, condition(pending)]) :-
        isbn("3-598-21515-X").

    test(empty_isbn, [fail, condition(pending)]) :-
        isbn("").

    test(input_is_9_characters, [fail, condition(pending)]) :-
        isbn("134456729").

    test(invalid_characters_are_not_ignored_after_checking_length, [fail, condition(pending)]) :-
        isbn("3132P34035").

    test(invalid_characters_are_not_ignored_before_checking_length, [fail, condition(pending)]) :-
        isbn("3598P215088").

    test(input_is_too_long_but_contains_a_valid_isbn, [fail, condition(pending)]) :-
        isbn("98245726788").

:- end_tests(isbn_verifier).
