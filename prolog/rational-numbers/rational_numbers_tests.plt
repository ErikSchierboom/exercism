pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(rational_numbers).

    test(add_two_positive_rational_numbers, condition(true)) :-
        create_rational(1, 2, Rational1),
        create_rational(2, 3, Rational2),
        add(Rational1, Rational2, Added),
        create_rational(7, 6, Expected),
        Added == Expected.

    test(add_a_positive_rational_number_and_a_negative_rational_number, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(-2, 3, Rational2),
        add(Rational1, Rational2, Added),
        create_rational(-1, 6, Expected),
        Added == Expected.

    test(add_two_negative_rational_numbers, condition(pending)) :-
        create_rational(-1, 2, Rational1),
        create_rational(-2, 3, Rational2),
        add(Rational1, Rational2, Added),
        create_rational(-7, 6, Expected),
        Added == Expected.

    test(add_a_rational_number_to_its_additive_inverse, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(-1, 2, Rational2),
        add(Rational1, Rational2, Added),
        create_rational(0, 1, Expected),
        Added == Expected.

    test(subtract_two_positive_rational_numbers, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(2, 3, Rational2),
        sub(Rational1, Rational2, Subtracted),
        create_rational(-1, 6, Expected),
        Subtracted == Expected.

    test(subtract_a_positive_rational_number_and_a_negative_rational_number, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(-2, 3, Rational2),
        sub(Rational1, Rational2, Subtracted),
        create_rational(7, 6, Expected),
        Subtracted == Expected.

    test(subtract_two_negative_rational_numbers, condition(pending)) :-
        create_rational(-1, 2, Rational1),
        create_rational(-2, 3, Rational2),
        sub(Rational1, Rational2, Subtracted),
        create_rational(1, 6, Expected),
        Subtracted == Expected.

    test(subtract_a_rational_number_from_itself, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(1, 2, Rational2),
        sub(Rational1, Rational2, Subtracted),
        create_rational(0, 1, Expected),
        Subtracted == Expected.

    test(multiply_two_positive_rational_numbers, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(2, 3, Rational2),
        mul(Rational1, Rational2, Multiplied),
        create_rational(1, 3, Expected),
        Multiplied == Expected.

    test(multiply_a_negative_rational_number_by_a_positive_rational_number, condition(pending)) :-
        create_rational(-1, 2, Rational1),
        create_rational(2, 3, Rational2),
        mul(Rational1, Rational2, Multiplied),
        create_rational(-1, 3, Expected),
        Multiplied == Expected.

    test(multiply_two_negative_rational_numbers, condition(pending)) :-
        create_rational(-1, 2, Rational1),
        create_rational(-2, 3, Rational2),
        mul(Rational1, Rational2, Multiplied),
        create_rational(1, 3, Expected),
        Multiplied == Expected.

    test(multiply_a_rational_number_by_its_reciprocal, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(2, 1, Rational2),
        mul(Rational1, Rational2, Multiplied),
        create_rational(1, 1, Expected),
        Multiplied == Expected.

    test(multiply_a_rational_number_by_1, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(1, 1, Rational2),
        mul(Rational1, Rational2, Multiplied),
        create_rational(1, 2, Expected),
        Multiplied == Expected.

    test(multiply_a_rational_number_by_0, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(0, 1, Rational2),
        mul(Rational1, Rational2, Multiplied),
        create_rational(0, 1, Expected),
        Multiplied == Expected.

    test(divide_two_positive_rational_numbers, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(2, 3, Rational2),
        div(Rational1, Rational2, Divided),
        create_rational(3, 4, Expected),
        Divided == Expected.

    test(divide_a_positive_rational_number_by_a_negative_rational_number, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(-2, 3, Rational2),
        div(Rational1, Rational2, Divided),
        create_rational(-3, 4, Expected),
        Divided == Expected.

    test(divide_two_negative_rational_numbers, condition(pending)) :-
        create_rational(-1, 2, Rational1),
        create_rational(-2, 3, Rational2),
        div(Rational1, Rational2, Divided),
        create_rational(3, 4, Expected),
        Divided == Expected.

    test(divide_a_rational_number_by_1, condition(pending)) :-
        create_rational(1, 2, Rational1),
        create_rational(1, 1, Rational2),
        div(Rational1, Rational2, Divided),
        create_rational(1, 2, Expected),
        Divided == Expected.

    test(absolute_value_of_a_positive_rational_number, condition(pending)) :-
        create_rational(1, 2, Rational),
        abs(Rational, Abs),
        create_rational(1, 2, Expected),
        Abs == Expected.

    test(absolute_value_of_a_positive_rational_number_with_negative_numerator_and_denominator, condition(pending)) :-
        create_rational(-1, -2, Rational),
        abs(Rational, Abs),
        create_rational(1, 2, Expected),
        Abs == Expected.

    test(absolute_value_of_a_negative_rational_number, condition(pending)) :-
        create_rational(-1, 2, Rational),
        abs(Rational, Abs),
        create_rational(1, 2, Expected),
        Abs == Expected.

    test(absolute_value_of_a_negative_rational_number_with_negative_denominator, condition(pending)) :-
        create_rational(1, -2, Rational),
        abs(Rational, Abs),
        create_rational(1, 2, Expected),
        Abs == Expected.

    test(absolute_value_of_zero, condition(pending)) :-
        create_rational(0, 1, Rational),
        abs(Rational, Abs),
        create_rational(0, 1, Expected),
        Abs == Expected.

    test(absolute_value_of_a_rational_number_is_reduced_to_lowest_terms, condition(pending)) :-
        create_rational(2, 4, Rational),
        abs(Rational, Abs),
        create_rational(1, 2, Expected),
        Abs == Expected.

    test(raise_a_positive_rational_number_to_a_positive_integer_power, condition(pending)) :-
        create_rational(1, 2, Rational),
        pow(Rational, 3, Pow),
        create_rational(1, 8, Expected),
        Pow == Expected.

    test(raise_a_negative_rational_number_to_a_positive_integer_power, condition(pending)) :-
        create_rational(-1, 2, Rational),
        pow(Rational, 3, Pow),
        create_rational(-1, 8, Expected),
        Pow == Expected.

    test(raise_a_positive_rational_number_to_a_negative_integer_power, condition(pending)) :-
        create_rational(3, 5, Rational),
        pow(Rational, -2, Pow),
        create_rational(25, 9, Expected),
        Pow == Expected.

    test(raise_a_negative_rational_number_to_an_even_negative_integer_power, condition(pending)) :-
        create_rational(-3, 5, Rational),
        pow(Rational, -2, Pow),
        create_rational(25, 9, Expected),
        Pow == Expected.

    test(raise_a_negative_rational_number_to_an_odd_negative_integer_power, condition(pending)) :-
        create_rational(-3, 5, Rational),
        pow(Rational, -3, Pow),
        create_rational(-125, 27, Expected),
        Pow == Expected.

    test(raise_zero_to_an_integer_power, condition(pending)) :-
        create_rational(0, 1, Rational),
        pow(Rational, 5, Pow),
        create_rational(0, 1, Expected),
        Pow == Expected.

    test(raise_one_to_an_integer_power, condition(pending)) :-
        create_rational(1, 1, Rational),
        pow(Rational, 4, Pow),
        create_rational(1, 1, Expected),
        Pow == Expected.

    test(raise_a_positive_rational_number_to_the_power_of_zero, condition(pending)) :-
        create_rational(1, 2, Rational),
        pow(Rational, 0, Pow),
        create_rational(1, 1, Expected),
        Pow == Expected.

    test(raise_a_negative_rational_number_to_the_power_of_zero, condition(pending)) :-
        create_rational(-1, 2, Rational),
        pow(Rational, 0, Pow),
        create_rational(1, 1, Expected),
        Pow == Expected.

    test(raise_a_real_number_to_a_positive_rational_number, condition(pending)) :-
        create_rational(4, 3, Rational),
        pow(8, Rational, Pow),
        abs(16.0 - Pow) < 0.00000001.

    test(raise_a_real_number_to_a_negative_rational_number, condition(pending)) :-
        create_rational(-1, 2, Rational),
        pow(9, Rational, Pow),
        abs(0.3333333333333333 - Pow) < 0.000000000000001.

    test(raise_a_real_number_to_a_zero_rational_number, condition(pending)) :-
        create_rational(0, 1, Rational),
        pow(2, Rational, Pow),
        Pow =:= 1.0.

    test(reduce_a_positive_rational_number_to_lowest_terms, condition(pending)) :-
        create_rational(2, 4, Rational1),
        create_rational(1, 2, Rational2),
        Rational1 == Rational2.

    test(reduce_places_the_minus_sign_on_the_numerator, condition(pending)) :-
        create_rational(3, -4, Rational1),
        create_rational(-3, 4, Rational2),
        Rational1 == Rational2.

    test(reduce_a_negative_rational_number_to_lowest_terms, condition(pending)) :-
        create_rational(-4, 6, Rational1),
        create_rational(-2, 3, Rational2),
        Rational1 == Rational2.

    test(reduce_a_rational_number_with_a_negative_denominator_to_lowest_terms, condition(pending)) :-
        create_rational(3, -9, Rational1),
        create_rational(-1, 3, Rational2),
        Rational1 == Rational2.

    test(reduce_zero_to_lowest_terms, condition(pending)) :-
        create_rational(0, 6, Rational1),
        create_rational(0, 1, Rational2),
        Rational1 == Rational2.

    test(reduce_an_integer_to_lowest_terms, condition(pending)) :-
        create_rational(-14, 7, Rational1),
        create_rational(-2, 1, Rational2),
        Rational1 == Rational2.

    test(reduce_one_to_lowest_terms, condition(pending)) :-
        create_rational(13, 13, Rational1),
        create_rational(1, 1, Rational2),
        Rational1 == Rational2.

:- end_tests(rational_numbers).
