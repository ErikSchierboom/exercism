pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(perfect_numbers).

    test(smallest_perfect_number_is_classified_correctly, condition(true)) :-
        classify(6, Classification),
        Classification == perfect.

    test(medium_perfect_number_is_classified_correctly, condition(pending)) :-
        classify(28, Classification),
        Classification == perfect.

    test(large_perfect_number_is_classified_correctly, condition(pending)) :-
        classify(33550336, Classification),
        Classification == perfect.

    test(smallest_abundant_number_is_classified_correctly, condition(pending)) :-
        classify(12, Classification),
        Classification == abundant.

    test(medium_abundant_number_is_classified_correctly, condition(pending)) :-
        classify(30, Classification),
        Classification == abundant.

    test(large_abundant_number_is_classified_correctly, condition(pending)) :-
        classify(33550335, Classification),
        Classification == abundant.

    test(smallest_prime_deficient_number_is_classified_correctly, condition(pending)) :-
        classify(2, Classification),
        Classification == deficient.

    test(smallest_non_prime_deficient_number_is_classified_correctly, condition(pending)) :-
        classify(4, Classification),
        Classification == deficient.

    test(medium_deficient_number_is_classified_correctly, condition(pending)) :-
        classify(32, Classification),
        Classification == deficient.

    test(large_deficient_number_is_classified_correctly, condition(pending)) :-
        classify(33550337, Classification),
        Classification == deficient.

    test(edge_case_no_factors_other_than_itself_is_classified_correctly, condition(pending)) :-
        classify(1, Classification),
        Classification == deficient.

    test(zero_is_rejected_as_it_is_not_a_positive_integer, [fail, condition(pending)]) :-
        classify(0, _).

    test(negative_integer_is_rejected_as_it_is_not_a_positive_integer, [fail, condition(pending)]) :-
        classify(-1, _).

:- end_tests(perfect_numbers).
