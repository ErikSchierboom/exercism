pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST_IS PENDING!\n'),
    fail.

:- begin_tests(armstrong_numbers).

    test(zero_is_an_armstrong_number, condition(true)) :-
        armstrong_number(0).

    test(single_digit_numbers_are_armstrong_numbers, condition(pending)) :-
        armstrong_number(5).

    test(there_are_no_two_digit_armstrong_numbers, [fail, condition(pending)]) :-
        armstrong_number(10).

    test(three_digit_number_that_is_an_armstrong_number, condition(pending)) :-
        armstrong_number(153).

    test(three_digit_number_that_is_not_an_armstrong_number, [fail, condition(pending)]) :-
        armstrong_number(100).

    test(four_digit_number_that_is_an_armstrong_number, condition(pending)) :-
        armstrong_number(9474).

    test(four_digit_number_that_is_not_an_armstrong_number, [fail, condition(pending)]) :-
        armstrong_number(9475).

    test(seven_digit_number_that_is_an_armstrong_number, condition(pending)) :-
        armstrong_number(9926315).

    test(seven_digit_number_that_is_not_an_armstrong_number, [fail, condition(pending)]) :-
        armstrong_number(9926314).

:- end_tests(armstrong_numbers).
