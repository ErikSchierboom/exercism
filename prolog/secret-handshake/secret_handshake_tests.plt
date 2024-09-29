pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(secret_handshake).

    test(wink_for_1, condition(true)) :-
        commands(1, Commands),
        Commands == [wink].

    test(double_blink_for_10, condition(true)) :-
        commands(2, Commands),
        Commands == [double_blink].

    test(close_your_eyes_for_100, condition(true)) :-
        commands(4, Commands),
        Commands == [close_your_eyes].

    test(jump_for_1000, condition(true)) :-
        commands(8, Commands),
        Commands == [jump].

    test(combine_two_actions, condition(true)) :-
        commands(3, Commands),
        Commands == [wink, double_blink].

    test(reverse_two_actions, condition(true)) :-
        commands(19, Commands),
        Commands == [double_blink, wink].

    test(reversing_one_action_gives_the_same_action, condition(true)) :-
        commands(24, Commands),
        Commands == [jump].

    test(reversing_no_actions_still_gives_no_actions, condition(true)) :-
        commands(16, Commands),
        Commands == [].

    test(all_possible_actions, condition(true)) :-
        commands(15, Commands),
        Commands == [wink, double_blink, close_your_eyes, jump].

    test(reverse_all_possible_actions, condition(true)) :-
        commands(31, Commands),
        Commands == [jump, close_your_eyes, double_blink, wink].

    test(do_nothing_for_zero, condition(true)) :-
        commands(0, Commands),
        Commands == [].

:- end_tests(secret_handshake).
