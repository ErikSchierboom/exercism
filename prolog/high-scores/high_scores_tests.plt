pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(high_scores).

    test(latest_score, condition(true)) :-
        latest([100, 0, 90, 30], Latest),
        Latest == 30.

    test(personal_best, condition(pending)) :-
        personal_best([40, 100, 70], Best),
        Best == 100.

    test(personal_top_three_from_a_list_of_scores, condition(pending)) :-
        Scores = [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70],
        personal_top_three(Scores, TopThree),
        TopThree == [100, 90, 70].

    test(personal_top_highest_to_lowest, condition(pending)) :-
        personal_top_three([20, 10, 30], TopThree),
        TopThree == [30, 20, 10].

    test(personal_top_when_there_is_a_tie, condition(pending)) :-
        personal_top_three([40, 20, 40, 30], TopThree),
        TopThree == [40, 40, 30].

    test(personal_top_when_there_are_less_than_3, condition(pending)) :-
        personal_top_three([30, 70], TopThree),
        TopThree == [70, 30].

    test(personal_top_when_there_is_only_one, condition(pending)) :-
        personal_top_three([40], TopThree),
        TopThree == [40].

:- end_tests(high_scores).
