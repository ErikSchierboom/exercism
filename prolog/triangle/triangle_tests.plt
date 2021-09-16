pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(equilateral_triangle).

    test(all_sides_are_equal, condition(true)) :-
        triangle(2, 2, 2, "equilateral").

    test(any_side_is_unequal, [fail, condition(true)]) :-
        triangle(2, 3, 2, "equilateral").

    test(no_sides_are_equal, [fail, condition(true)]) :-
        triangle(5, 4, 6, "equilateral").

    test(all_zero_sides_are_not_a_triangle, [fail, condition(true)]) :-
        triangle(0, 0, 0, "equilateral").

    test(all_sides_are_floats_and_equal, condition(true)) :-
        triangle((0.5), (0.5), (0.5), "equilateral").

:- end_tests(equilateral_triangle).

:- begin_tests(isosceles_triangle).

    test(last_two_sides_equal, condition(true)) :-
        triangle(3, 4, 4, "isosceles").

    test(first_two_sides_equal, condition(true)) :-
        triangle(4, 4, 3, "isosceles").

    test(first_and_last_sides_equal, condition(true)) :-
        triangle(4, 3, 4, "isosceles").

    test(equilateral_triangles_are_also_isosceles, condition(true)) :-
        triangle(4, 4, 4, "isosceles").

    test(no_sides_are_equal, [fail, condition(true)]) :-
        triangle(2, 3, 4, "isosceles").

    test(first_triangle_inequality_violation, [fail, condition(true)]) :-
        triangle(1, 1, 3, "isosceles").

    test(second_triangle_inequality_violation, [fail, condition(true)]) :-
        triangle(1, 3, 1, "isosceles").

    test(third_triangle_inequality_violation, [fail, condition(true)]) :-
        triangle(3, 1, 1, "isosceles").

    test(sides_may_be_floats, condition(true)) :-
        triangle((0.5), (0.4), (0.5), "isosceles").

:- end_tests(isosceles_triangle).

:- begin_tests(scalene_triangle).

    test(no_sides_are_equal, condition(true)) :-
        triangle(5, 4, 6, "scalene").

    test(all_sides_are_equal, [fail, condition(true)]) :-
        triangle(4, 4, 4, "scalene").

    test(two_sides_are_equal, [fail, condition(true)]) :-
        triangle(4, 4, 3, "scalene").

    test(may_not_violate_triangle_inequality, [fail, condition(true)]) :-
        triangle(7, 3, 2, "scalene").

    test(small_scalene_triangle_with_floating_point_values, condition(true)) :-
        triangle((0.5), (0.4), (0.6), "scalene").

:- end_tests(scalene_triangle).
