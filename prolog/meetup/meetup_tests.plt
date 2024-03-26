pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(meetup).

    test(when_first_monday_is_some_day_in_the_middle_of_the_first_week, condition(true)) :-
        meetup(2013, 3, first, 'Monday', Date),
        Date == date(2013, 3, 4).

    test(when_first_monday_is_the_1st_the_first_day_of_the_first_week, condition(pending)) :-
        meetup(2013, 4, first, 'Monday', Date),
        Date == date(2013, 4, 1).

    test(when_first_tuesday_is_the_7th_the_last_day_of_the_first_week, condition(pending)) :-
        meetup(2013, 5, first, 'Tuesday', Date),
        Date == date(2013, 5, 7).

    test(when_first_tuesday_is_some_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 6, first, 'Tuesday', Date),
        Date == date(2013, 6, 4).

    test(when_first_wednesday_is_some_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 7, first, 'Wednesday', Date),
        Date == date(2013, 7, 3).

    test(when_first_wednesday_is_the_7th_the_last_day_of_the_first_week, condition(pending)) :-
        meetup(2013, 8, first, 'Wednesday', Date),
        Date == date(2013, 8, 7).

    test(when_first_thursday_is_some_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 9, first, 'Thursday', Date),
        Date == date(2013, 9, 5).

    test(when_first_thursday_is_another_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 10, first, 'Thursday', Date),
        Date == date(2013, 10, 3).

    test(when_first_friday_is_the_1st_the_first_day_of_the_first_week, condition(pending)) :-
        meetup(2013, 11, first, 'Friday', Date),
        Date == date(2013, 11, 1).

    test(when_first_friday_is_some_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 12, first, 'Friday', Date),
        Date == date(2013, 12, 6).

    test(when_first_saturday_is_some_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 1, first, 'Saturday', Date),
        Date == date(2013, 1, 5).

    test(when_first_saturday_is_another_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 2, first, 'Saturday', Date),
        Date == date(2013, 2, 2).

    test(when_first_sunday_is_some_day_in_the_middle_of_the_first_week, condition(pending)) :-
        meetup(2013, 3, first, 'Sunday', Date),
        Date == date(2013, 3, 3).

    test(when_first_sunday_is_the_7th_the_last_day_of_the_first_week, condition(pending)) :-
        meetup(2013, 4, first, 'Sunday', Date),
        Date == date(2013, 4, 7).

    test(when_second_monday_is_some_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 3, second, 'Monday', Date),
        Date == date(2013, 3, 11).

    test(when_second_monday_is_the_8th_the_first_day_of_the_second_week, condition(pending)) :-
        meetup(2013, 4, second, 'Monday', Date),
        Date == date(2013, 4, 8).

    test(when_second_tuesday_is_the_14th_the_last_day_of_the_second_week, condition(pending)) :-
        meetup(2013, 5, second, 'Tuesday', Date),
        Date == date(2013, 5, 14).

    test(when_second_tuesday_is_some_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 6, second, 'Tuesday', Date),
        Date == date(2013, 6, 11).

    test(when_second_wednesday_is_some_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 7, second, 'Wednesday', Date),
        Date == date(2013, 7, 10).

    test(when_second_wednesday_is_the_14th_the_last_day_of_the_second_week, condition(pending)) :-
        meetup(2013, 8, second, 'Wednesday', Date),
        Date == date(2013, 8, 14).

    test(when_second_thursday_is_some_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 9, second, 'Thursday', Date),
        Date == date(2013, 9, 12).

    test(when_second_thursday_is_another_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 10, second, 'Thursday', Date),
        Date == date(2013, 10, 10).

    test(when_second_friday_is_the_8th_the_first_day_of_the_second_week, condition(pending)) :-
        meetup(2013, 11, second, 'Friday', Date),
        Date == date(2013, 11, 8).

    test(when_second_friday_is_some_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 12, second, 'Friday', Date),
        Date == date(2013, 12, 13).

    test(when_second_saturday_is_some_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 1, second, 'Saturday', Date),
        Date == date(2013, 1, 12).

    test(when_second_saturday_is_another_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 2, second, 'Saturday', Date),
        Date == date(2013, 2, 9).

    test(when_second_sunday_is_some_day_in_the_middle_of_the_second_week, condition(pending)) :-
        meetup(2013, 3, second, 'Sunday', Date),
        Date == date(2013, 3, 10).

    test(when_second_sunday_is_the_14th_the_last_day_of_the_second_week, condition(pending)) :-
        meetup(2013, 4, second, 'Sunday', Date),
        Date == date(2013, 4, 14).

    test(when_third_monday_is_some_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 3, third, 'Monday', Date),
        Date == date(2013, 3, 18).

    test(when_third_monday_is_the_15th_the_first_day_of_the_third_week, condition(pending)) :-
        meetup(2013, 4, third, 'Monday', Date),
        Date == date(2013, 4, 15).

    test(when_third_tuesday_is_the_21st_the_last_day_of_the_third_week, condition(pending)) :-
        meetup(2013, 5, third, 'Tuesday', Date),
        Date == date(2013, 5, 21).

    test(when_third_tuesday_is_some_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 6, third, 'Tuesday', Date),
        Date == date(2013, 6, 18).

    test(when_third_wednesday_is_some_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 7, third, 'Wednesday', Date),
        Date == date(2013, 7, 17).

    test(when_third_wednesday_is_the_21st_the_last_day_of_the_third_week, condition(pending)) :-
        meetup(2013, 8, third, 'Wednesday', Date),
        Date == date(2013, 8, 21).

    test(when_third_thursday_is_some_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 9, third, 'Thursday', Date),
        Date == date(2013, 9, 19).

    test(when_third_thursday_is_another_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 10, third, 'Thursday', Date),
        Date == date(2013, 10, 17).

    test(when_third_friday_is_the_15th_the_first_day_of_the_third_week, condition(pending)) :-
        meetup(2013, 11, third, 'Friday', Date),
        Date == date(2013, 11, 15).

    test(when_third_friday_is_some_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 12, third, 'Friday', Date),
        Date == date(2013, 12, 20).

    test(when_third_saturday_is_some_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 1, third, 'Saturday', Date),
        Date == date(2013, 1, 19).

    test(when_third_saturday_is_another_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 2, third, 'Saturday', Date),
        Date == date(2013, 2, 16).

    test(when_third_sunday_is_some_day_in_the_middle_of_the_third_week, condition(pending)) :-
        meetup(2013, 3, third, 'Sunday', Date),
        Date == date(2013, 3, 17).

    test(when_third_sunday_is_the_21st_the_last_day_of_the_third_week, condition(pending)) :-
        meetup(2013, 4, third, 'Sunday', Date),
        Date == date(2013, 4, 21).

    test(when_fourth_monday_is_some_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 3, fourth, 'Monday', Date),
        Date == date(2013, 3, 25).

    test(when_fourth_monday_is_the_22nd_the_first_day_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 4, fourth, 'Monday', Date),
        Date == date(2013, 4, 22).

    test(when_fourth_tuesday_is_the_28th_the_last_day_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 5, fourth, 'Tuesday', Date),
        Date == date(2013, 5, 28).

    test(when_fourth_tuesday_is_some_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 6, fourth, 'Tuesday', Date),
        Date == date(2013, 6, 25).

    test(when_fourth_wednesday_is_some_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 7, fourth, 'Wednesday', Date),
        Date == date(2013, 7, 24).

    test(when_fourth_wednesday_is_the_28th_the_last_day_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 8, fourth, 'Wednesday', Date),
        Date == date(2013, 8, 28).

    test(when_fourth_thursday_is_some_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 9, fourth, 'Thursday', Date),
        Date == date(2013, 9, 26).

    test(when_fourth_thursday_is_another_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 10, fourth, 'Thursday', Date),
        Date == date(2013, 10, 24).

    test(when_fourth_friday_is_the_22nd_the_first_day_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 11, fourth, 'Friday', Date),
        Date == date(2013, 11, 22).

    test(when_fourth_friday_is_some_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 12, fourth, 'Friday', Date),
        Date == date(2013, 12, 27).

    test(when_fourth_saturday_is_some_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 1, fourth, 'Saturday', Date),
        Date == date(2013, 1, 26).

    test(when_fourth_saturday_is_another_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 2, fourth, 'Saturday', Date),
        Date == date(2013, 2, 23).

    test(when_fourth_sunday_is_some_day_in_the_middle_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 3, fourth, 'Sunday', Date),
        Date == date(2013, 3, 24).

    test(when_fourth_sunday_is_the_28th_the_last_day_of_the_fourth_week, condition(pending)) :-
        meetup(2013, 4, fourth, 'Sunday', Date),
        Date == date(2013, 4, 28).

    test(last_monday_in_a_month_with_four_mondays, condition(pending)) :-
        meetup(2013, 3, last, 'Monday', Date),
        Date == date(2013, 3, 25).

    test(last_monday_in_a_month_with_five_mondays, condition(pending)) :-
        meetup(2013, 4, last, 'Monday', Date),
        Date == date(2013, 4, 29).

    test(last_tuesday_in_a_month_with_four_tuesdays, condition(pending)) :-
        meetup(2013, 5, last, 'Tuesday', Date),
        Date == date(2013, 5, 28).

    test(last_tuesday_in_another_month_with_four_tuesdays, condition(pending)) :-
        meetup(2013, 6, last, 'Tuesday', Date),
        Date == date(2013, 6, 25).

    test(last_wednesday_in_a_month_with_five_wednesdays, condition(pending)) :-
        meetup(2013, 7, last, 'Wednesday', Date),
        Date == date(2013, 7, 31).

    test(last_wednesday_in_a_month_with_four_wednesdays, condition(pending)) :-
        meetup(2013, 8, last, 'Wednesday', Date),
        Date == date(2013, 8, 28).

    test(last_thursday_in_a_month_with_four_thursdays, condition(pending)) :-
        meetup(2013, 9, last, 'Thursday', Date),
        Date == date(2013, 9, 26).

    test(last_thursday_in_a_month_with_five_thursdays, condition(pending)) :-
        meetup(2013, 10, last, 'Thursday', Date),
        Date == date(2013, 10, 31).

    test(last_friday_in_a_month_with_five_fridays, condition(pending)) :-
        meetup(2013, 11, last, 'Friday', Date),
        Date == date(2013, 11, 29).

    test(last_friday_in_a_month_with_four_fridays, condition(pending)) :-
        meetup(2013, 12, last, 'Friday', Date),
        Date == date(2013, 12, 27).

    test(last_saturday_in_a_month_with_four_saturdays, condition(pending)) :-
        meetup(2013, 1, last, 'Saturday', Date),
        Date == date(2013, 1, 26).

    test(last_saturday_in_another_month_with_four_saturdays, condition(pending)) :-
        meetup(2013, 2, last, 'Saturday', Date),
        Date == date(2013, 2, 23).

    test(last_sunday_in_a_month_with_five_sundays, condition(pending)) :-
        meetup(2013, 3, last, 'Sunday', Date),
        Date == date(2013, 3, 31).

    test(last_sunday_in_a_month_with_four_sundays, condition(pending)) :-
        meetup(2013, 4, last, 'Sunday', Date),
        Date == date(2013, 4, 28).

    test(when_last_wednesday_in_february_in_a_leap_year_is_the_29th, condition(pending)) :-
        meetup(2012, 2, last, 'Wednesday', Date),
        Date == date(2012, 2, 29).

    test(last_wednesday_in_december_that_is_also_the_last_day_of_the_year, condition(pending)) :-
        meetup(2014, 12, last, 'Wednesday', Date),
        Date == date(2014, 12, 31).

    test(when_last_sunday_in_february_in_a_non_leap_year_is_not_the_29th, condition(pending)) :-
        meetup(2015, 2, last, 'Sunday', Date),
        Date == date(2015, 2, 22).

    test(when_first_friday_is_the_7th_the_last_day_of_the_first_week, condition(pending)) :-
        meetup(2012, 12, first, 'Friday', Date),
        Date == date(2012, 12, 7).

    test(when_teenth_monday_is_the_13th_the_first_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 5, teenth, 'Monday', Date),
        Date == date(2013, 5, 13).

    test(when_teenth_monday_is_the_19th_the_last_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 8, teenth, 'Monday', Date),
        Date == date(2013, 8, 19).

    test(when_teenth_monday_is_some_day_in_the_middle_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 9, teenth, 'Monday', Date),
        Date == date(2013, 9, 16).

    test(when_teenth_tuesday_is_the_19th_the_last_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 3, teenth, 'Tuesday', Date),
        Date == date(2013, 3, 19).

    test(when_teenth_tuesday_is_some_day_in_the_middle_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 4, teenth, 'Tuesday', Date),
        Date == date(2013, 4, 16).

    test(when_teenth_tuesday_is_the_13th_the_first_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 8, teenth, 'Tuesday', Date),
        Date == date(2013, 8, 13).

    test(when_teenth_wednesday_is_some_day_in_the_middle_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 1, teenth, 'Wednesday', Date),
        Date == date(2013, 1, 16).

    test(when_teenth_wednesday_is_the_13th_the_first_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 2, teenth, 'Wednesday', Date),
        Date == date(2013, 2, 13).

    test(when_teenth_wednesday_is_the_19th_the_last_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 6, teenth, 'Wednesday', Date),
        Date == date(2013, 6, 19).

    test(when_teenth_thursday_is_some_day_in_the_middle_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 5, teenth, 'Thursday', Date),
        Date == date(2013, 5, 16).

    test(when_teenth_thursday_is_the_13th_the_first_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 6, teenth, 'Thursday', Date),
        Date == date(2013, 6, 13).

    test(when_teenth_thursday_is_the_19th_the_last_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 9, teenth, 'Thursday', Date),
        Date == date(2013, 9, 19).

    test(when_teenth_friday_is_the_19th_the_last_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 4, teenth, 'Friday', Date),
        Date == date(2013, 4, 19).

    test(when_teenth_friday_is_some_day_in_the_middle_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 8, teenth, 'Friday', Date),
        Date == date(2013, 8, 16).

    test(when_teenth_friday_is_the_13th_the_first_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 9, teenth, 'Friday', Date),
        Date == date(2013, 9, 13).

    test(when_teenth_saturday_is_some_day_in_the_middle_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 2, teenth, 'Saturday', Date),
        Date == date(2013, 2, 16).

    test(when_teenth_saturday_is_the_13th_the_first_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 4, teenth, 'Saturday', Date),
        Date == date(2013, 4, 13).

    test(when_teenth_saturday_is_the_19th_the_last_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 10, teenth, 'Saturday', Date),
        Date == date(2013, 10, 19).

    test(when_teenth_sunday_is_the_19th_the_last_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 5, teenth, 'Sunday', Date),
        Date == date(2013, 5, 19).

    test(when_teenth_sunday_is_some_day_in_the_middle_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 6, teenth, 'Sunday', Date),
        Date == date(2013, 6, 16).

    test(when_teenth_sunday_is_the_13th_the_first_day_of_the_teenth_week, condition(pending)) :-
        meetup(2013, 10, teenth, 'Sunday', Date),
        Date == date(2013, 10, 13).

:- end_tests(meetup).
