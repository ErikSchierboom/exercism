pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(clock).

    test(on_the_hour, condition(true)) :-
        create_clock(8, 0, Clock),
        display(Clock, Time),
        Time == "08:00".

    test(past_the_hour, condition(pending)) :-
        create_clock(11, 9, Clock),
        display(Clock, Time),
        Time == "11:09".

    test(midnight_is_zero_hours, condition(pending)) :-
        create_clock(24, 0, Clock),
        display(Clock, Time),
        Time == "00:00".

    test(hour_rolls_over, condition(pending)) :-
        create_clock(25, 0, Clock),
        display(Clock, Time),
        Time == "01:00".

    test(hour_rolls_over_continuously, condition(pending)) :-
        create_clock(100, 0, Clock),
        display(Clock, Time),
        Time == "04:00".

    test(sixty_minutes_is_next_hour, condition(pending)) :-
        create_clock(1, 60, Clock),
        display(Clock, Time),
        Time == "02:00".

    test(minutes_roll_over, condition(pending)) :-
        create_clock(0, 160, Clock),
        display(Clock, Time),
        Time == "02:40".

    test(minutes_roll_over_continuously, condition(pending)) :-
        create_clock(0, 1723, Clock),
        display(Clock, Time),
        Time == "04:43".

    test(hour_and_minutes_roll_over, condition(pending)) :-
        create_clock(25, 160, Clock),
        display(Clock, Time),
        Time == "03:40".

    test(hour_and_minutes_roll_over_continuously, condition(pending)) :-
        create_clock(201, 3001, Clock),
        display(Clock, Time),
        Time == "11:01".

    test(hour_and_minutes_roll_over_to_exactly_midnight, condition(pending)) :-
        create_clock(72, 8640, Clock),
        display(Clock, Time),
        Time == "00:00".

    test(negative_hour, condition(pending)) :-
        create_clock(-1, 15, Clock),
        display(Clock, Time),
        Time == "23:15".

    test(negative_hour_rolls_over, condition(pending)) :-
        create_clock(-25, 0, Clock),
        display(Clock, Time),
        Time == "23:00".

    test(negative_hour_rolls_over_continuously, condition(pending)) :-
        create_clock(-91, 0, Clock),
        display(Clock, Time),
        Time == "05:00".

    test(negative_minutes, condition(pending)) :-
        create_clock(1, -40, Clock),
        display(Clock, Time),
        Time == "00:20".

    test(negative_minutes_roll_over, condition(pending)) :-
        create_clock(1, -160, Clock),
        display(Clock, Time),
        Time == "22:20".

    test(negative_minutes_roll_over_continuously, condition(pending)) :-
        create_clock(1, -4820, Clock),
        display(Clock, Time),
        Time == "16:40".

    test(negative_sixty_minutes_is_previous_hour, condition(pending)) :-
        create_clock(2, -60, Clock),
        display(Clock, Time),
        Time == "01:00".

    test(negative_hour_and_minutes_both_roll_over, condition(pending)) :-
        create_clock(-25, -160, Clock),
        display(Clock, Time),
        Time == "20:20".

    test(negative_hour_and_minutes_both_roll_over_continuously, condition(pending)) :-
        create_clock(-121, -5810, Clock),
        display(Clock, Time),
        Time == "22:10".

    test(add_minutes, condition(pending)) :-
        create_clock(10, 0, Clock),
        add_minutes(Clock, 3, NewClock),
        display(NewClock, Time),
        Time == "10:03".

    test(add_no_minutes, condition(pending)) :-
        create_clock(6, 41, Clock),
        add_minutes(Clock, 0, NewClock),
        display(NewClock, Time),
        Time == "06:41".

    test(add_to_next_hour, condition(pending)) :-
        create_clock(0, 45, Clock),
        add_minutes(Clock, 40, NewClock),
        display(NewClock, Time),
        Time == "01:25".

    test(add_more_than_one_hour, condition(pending)) :-
        create_clock(10, 0, Clock),
        add_minutes(Clock, 61, NewClock),
        display(NewClock, Time),
        Time == "11:01".

    test(add_more_than_two_hours_with_carry, condition(pending)) :-
        create_clock(0, 45, Clock),
        add_minutes(Clock, 160, NewClock),
        display(NewClock, Time),
        Time == "03:25".

    test(add_across_midnight, condition(pending)) :-
        create_clock(23, 59, Clock),
        add_minutes(Clock, 2, NewClock),
        display(NewClock, Time),
        Time == "00:01".

    test(add_more_than_one_day_1500_min_25_hrs, condition(pending)) :-
        create_clock(5, 32, Clock),
        add_minutes(Clock, 1500, NewClock),
        display(NewClock, Time),
        Time == "06:32".

    test(add_more_than_two_days, condition(pending)) :-
        create_clock(1, 1, Clock),
        add_minutes(Clock, 3500, NewClock),
        display(NewClock, Time),
        Time == "11:21".

    test(subtract_minutes, condition(pending)) :-
        create_clock(10, 3, Clock),
        subtract_minutes(Clock, 3, NewClock),
        display(NewClock, Time),
        Time == "10:00".

    test(subtract_to_previous_hour, condition(pending)) :-
        create_clock(10, 3, Clock),
        subtract_minutes(Clock, 30, NewClock),
        display(NewClock, Time),
        Time == "09:33".

    test(subtract_more_than_an_hour, condition(pending)) :-
        create_clock(10, 3, Clock),
        subtract_minutes(Clock, 70, NewClock),
        display(NewClock, Time),
        Time == "08:53".

    test(subtract_across_midnight, condition(pending)) :-
        create_clock(0, 3, Clock),
        subtract_minutes(Clock, 4, NewClock),
        display(NewClock, Time),
        Time == "23:59".

    test(subtract_more_than_two_hours, condition(pending)) :-
        create_clock(0, 0, Clock),
        subtract_minutes(Clock, 160, NewClock),
        display(NewClock, Time),
        Time == "21:20".

    test(subtract_more_than_two_hours_with_borrow, condition(pending)) :-
        create_clock(6, 15, Clock),
        subtract_minutes(Clock, 160, NewClock),
        display(NewClock, Time),
        Time == "03:35".

    test(subtract_more_than_one_day_1500_min_25_hrs, condition(pending)) :-
        create_clock(5, 32, Clock),
        subtract_minutes(Clock, 1500, NewClock),
        display(NewClock, Time),
        Time == "04:32".

    test(subtract_more_than_two_days, condition(pending)) :-
        create_clock(2, 20, Clock),
        subtract_minutes(Clock, 3000, NewClock),
        display(NewClock, Time),
        Time == "00:20".

    test(clocks_with_same_time, condition(pending)) :-
        create_clock(15, 37, Clock1),
        create_clock(15, 37, Clock2),
        Clock1 == Clock2.

    test(clocks_a_minute_apart, condition(pending)) :-
        create_clock(15, 36, Clock1),
        create_clock(15, 37, Clock2),
        Clock1 \= Clock2.

    test(clocks_an_hour_apart, condition(pending)) :-
        create_clock(14, 37, Clock1),
        create_clock(15, 37, Clock2),
        Clock1 \= Clock2.

    test(clocks_with_hour_overflow, condition(pending)) :-
        create_clock(10, 37, Clock1),
        create_clock(34, 37, Clock2),
        Clock1 == Clock2.

    test(clocks_with_hour_overflow_by_several_days, condition(pending)) :-
        create_clock(3, 11, Clock1),
        create_clock(99, 11, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_hour, condition(pending)) :-
        create_clock(22, 40, Clock1),
        create_clock(-2, 40, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_hour_that_wraps, condition(pending)) :-
        create_clock(17, 3, Clock1),
        create_clock(-31, 3, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_hour_that_wraps_multiple_times, condition(pending)) :-
        create_clock(13, 49, Clock1),
        create_clock(-83, 49, Clock2),
        Clock1 == Clock2.

    test(clocks_with_minute_overflow, condition(pending)) :-
        create_clock(0, 1, Clock1),
        create_clock(0, 1441, Clock2),
        Clock1 == Clock2.

    test(clocks_with_minute_overflow_by_several_days, condition(pending)) :-
        create_clock(2, 2, Clock1),
        create_clock(2, 4322, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_minute, condition(pending)) :-
        create_clock(2, 40, Clock1),
        create_clock(3, -20, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_minute_that_wraps, condition(pending)) :-
        create_clock(4, 10, Clock1),
        create_clock(5, -1490, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_minute_that_wraps_multiple_times, condition(pending)) :-
        create_clock(6, 15, Clock1),
        create_clock(6, -4305, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_hours_and_minutes, condition(pending)) :-
        create_clock(7, 32, Clock1),
        create_clock(-12, -268, Clock2),
        Clock1 == Clock2.

    test(clocks_with_negative_hours_and_minutes_that_wrap, condition(pending)) :-
        create_clock(18, 7, Clock1),
        create_clock(-54, -11513, Clock2),
        Clock1 == Clock2.

    test(full_clock_and_zeroed_clock, condition(pending)) :-
        create_clock(24, 0, Clock1),
        create_clock(0, 0, Clock2),
        Clock1 == Clock2.

:- end_tests(clock).
