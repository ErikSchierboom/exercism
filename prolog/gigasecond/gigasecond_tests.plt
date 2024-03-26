pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(gigasecond).

    test(date_only_specification_of_time, condition(true)) :-
        add_gigasecond(date(2011, 4, 25, 0, 0, 0.0, 0, 'UTC', -), GigasecondDate),
        GigasecondDate == date(2043, 1, 1, 1, 46, 40.0, 0, 'UTC', -).

    test(second_test_for_date_only_specification_of_time, condition(pending)) :-
        add_gigasecond(date(1977, 6, 13, 0, 0, 0, 0, 'UTC', -), GigasecondDate),
        GigasecondDate == date(2009, 2, 19, 1, 46, 40.0, 0, 'UTC', -).

    test(third_test_for_date_only_specification_of_time, condition(pending)) :-
        add_gigasecond(date(1959, 7, 19, 0, 0, 0, 0, 'UTC', -), GigasecondDate),
        GigasecondDate == date(1991, 3, 27, 1, 46, 40.0, 0, 'UTC', -).

    test(full_time_specified, condition(pending)) :-
        add_gigasecond(date(2015, 1, 24, 22, 0, 0, 0, 'UTC', -), GigasecondDate),
        GigasecondDate == date(2046, 10, 2, 23, 46, 40.0, 0, 'UTC', -).

:- end_tests(gigasecond).
