pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(darts).

    test(missed_target, condition(true)) :-
        score(-(9), 9, Score),
        Score == 0.

    test(on_the_outer_circle, condition(pending)) :-
        score(0, 10, Score),
        Score == 1.

    test(on_the_middle_circle, condition(pending)) :-
        score(-(5), 0, Score),
        Score == 5.

    test(on_the_inner_circle, condition(pending)) :-
        score(0, -(1), Score),
        Score == 10.

    test(exactly_on_center, condition(pending)) :-
        score(0, 0, Score),
        Score == 10.

    test(near_the_center, condition(pending)) :-
        score(-(0.1), -(0.1), Score),
        Score == 10.

    test(just_within_the_inner_circle, condition(pending)) :-
        score(0.7, 0.7, Score),
        Score == 10.

    test(just_outside_the_inner_circle, condition(pending)) :-
        score(0.8, -(0.8), Score),
        Score == 5.

    test(just_within_the_middle_circle, condition(pending)) :-
        score(-(3.5), 3.5, Score),
        Score == 5.

    test(just_outside_the_middle_circle, condition(pending)) :-
        score(-(3.6), -(3.6), Score),
        Score == 1.

    test(just_within_the_outer_circle, condition(pending)) :-
        score(-(7.0), 7.0, Score),
        Score == 1.

    test(just_outside_the_outer_circle, condition(pending)) :-
        score(7.1, -(7.1), Score),
        Score == 0.

    test(asymmetric_position_between_the_inner_and_middle_circles, condition(pending)) :-
        score(0.5, -(4), Score),
        Score == 5.

:- end_tests(darts).
