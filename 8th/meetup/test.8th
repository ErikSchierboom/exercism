"meetup.8th" f:include
needs exercism/test
with: test
95 tests

: >date-only \ d -- d
    d:/ 0 3 a:slice [0, 0, 0, 0, 0, 0, 0] a:+ d:join
;

"when teenth Monday is the 13th, the first day of the teenth week"
    ( 2013 5 "Monday" "teenth" meetup >date-only )
    [2013, 05, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

SKIP-REST-OF-TESTS

"when teenth Monday is the 19th, the last day of the teenth week"
    ( 2013 8 "Monday" "teenth" meetup >date-only )
    [2013, 08, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Monday is some day in the middle of the teenth week"
    ( 2013 9 "Monday" "teenth" meetup >date-only )
    [2013, 09, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Tuesday is the 19th, the last day of the teenth week"
    ( 2013 3 "Tuesday" "teenth" meetup >date-only )
    [2013, 03, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Tuesday is some day in the middle of the teenth week"
    ( 2013 4 "Tuesday" "teenth" meetup >date-only )
    [2013, 04, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Tuesday is the 13th, the first day of the teenth week"
    ( 2013 8 "Tuesday" "teenth" meetup >date-only )
    [2013, 08, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Wednesday is some day in the middle of the teenth week"
    ( 2013 1 "Wednesday" "teenth" meetup >date-only )
    [2013, 01, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Wednesday is the 13th, the first day of the teenth week"
    ( 2013 2 "Wednesday" "teenth" meetup >date-only )
    [2013, 02, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Wednesday is the 19th, the last day of the teenth week"
    ( 2013 6 "Wednesday" "teenth" meetup >date-only )
    [2013, 06, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Thursday is some day in the middle of the teenth week"
    ( 2013 5 "Thursday" "teenth" meetup >date-only )
    [2013, 05, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Thursday is the 13th, the first day of the teenth week"
    ( 2013 6 "Thursday" "teenth" meetup >date-only )
    [2013, 06, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Thursday is the 19th, the last day of the teenth week"
    ( 2013 9 "Thursday" "teenth" meetup >date-only )
    [2013, 09, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Friday is the 19th, the last day of the teenth week"
    ( 2013 4 "Friday" "teenth" meetup >date-only )
    [2013, 04, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Friday is some day in the middle of the teenth week"
    ( 2013 8 "Friday" "teenth" meetup >date-only )
    [2013, 08, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Friday is the 13th, the first day of the teenth week"
    ( 2013 9 "Friday" "teenth" meetup >date-only )
    [2013, 09, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Saturday is some day in the middle of the teenth week"
    ( 2013 2 "Saturday" "teenth" meetup >date-only )
    [2013, 02, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Saturday is the 13th, the first day of the teenth week"
    ( 2013 4 "Saturday" "teenth" meetup >date-only )
    [2013, 04, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Saturday is the 19th, the last day of the teenth week"
    ( 2013 10 "Saturday" "teenth" meetup >date-only )
    [2013, 10, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Sunday is the 19th, the last day of the teenth week"
    ( 2013 5 "Sunday" "teenth" meetup >date-only )
    [2013, 05, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Sunday is some day in the middle of the teenth week"
    ( 2013 6 "Sunday" "teenth" meetup >date-only )
    [2013, 06, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when teenth Sunday is the 13th, the first day of the teenth week"
    ( 2013 10 "Sunday" "teenth" meetup >date-only )
    [2013, 10, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Monday is some day in the middle of the first week"
    ( 2013 3 "Monday" "first" meetup >date-only )
    [2013, 03, 04, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Monday is the 1st, the first day of the first week"
    ( 2013 4 "Monday" "first" meetup >date-only )
    [2013, 04, 01, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Tuesday is the 7th, the last day of the first week"
    ( 2013 5 "Tuesday" "first" meetup >date-only )
    [2013, 05, 07, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Tuesday is some day in the middle of the first week"
    ( 2013 6 "Tuesday" "first" meetup >date-only )
    [2013, 06, 04, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Wednesday is some day in the middle of the first week"
    ( 2013 7 "Wednesday" "first" meetup >date-only )
    [2013, 07, 03, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Wednesday is the 7th, the last day of the first week"
    ( 2013 8 "Wednesday" "first" meetup >date-only )
    [2013, 08, 07, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Thursday is some day in the middle of the first week"
    ( 2013 9 "Thursday" "first" meetup >date-only )
    [2013, 09, 05, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Thursday is another day in the middle of the first week"
    ( 2013 10 "Thursday" "first" meetup >date-only )
    [2013, 10, 03, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Friday is the 1st, the first day of the first week"
    ( 2013 11 "Friday" "first" meetup >date-only )
    [2013, 11, 01, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Friday is some day in the middle of the first week"
    ( 2013 12 "Friday" "first" meetup >date-only )
    [2013, 12, 06, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Saturday is some day in the middle of the first week"
    ( 2013 1 "Saturday" "first" meetup >date-only )
    [2013, 01, 05, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Saturday is another day in the middle of the first week"
    ( 2013 2 "Saturday" "first" meetup >date-only )
    [2013, 02, 02, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Sunday is some day in the middle of the first week"
    ( 2013 3 "Sunday" "first" meetup >date-only )
    [2013, 03, 03, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Sunday is the 7th, the last day of the first week"
    ( 2013 4 "Sunday" "first" meetup >date-only )
    [2013, 04, 07, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Monday is some day in the middle of the second week"
    ( 2013 3 "Monday" "second" meetup >date-only )
    [2013, 03, 11, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Monday is the 8th, the first day of the second week"
    ( 2013 4 "Monday" "second" meetup >date-only )
    [2013, 04, 08, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Tuesday is the 14th, the last day of the second week"
    ( 2013 5 "Tuesday" "second" meetup >date-only )
    [2013, 05, 14, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Tuesday is some day in the middle of the second week"
    ( 2013 6 "Tuesday" "second" meetup >date-only )
    [2013, 06, 11, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Wednesday is some day in the middle of the second week"
    ( 2013 7 "Wednesday" "second" meetup >date-only )
    [2013, 07, 10, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Wednesday is the 14th, the last day of the second week"
    ( 2013 8 "Wednesday" "second" meetup >date-only )
    [2013, 08, 14, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Thursday is some day in the middle of the second week"
    ( 2013 9 "Thursday" "second" meetup >date-only )
    [2013, 09, 12, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Thursday is another day in the middle of the second week"
    ( 2013 10 "Thursday" "second" meetup >date-only )
    [2013, 10, 10, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Friday is the 8th, the first day of the second week"
    ( 2013 11 "Friday" "second" meetup >date-only )
    [2013, 11, 08, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Friday is some day in the middle of the second week"
    ( 2013 12 "Friday" "second" meetup >date-only )
    [2013, 12, 13, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Saturday is some day in the middle of the second week"
    ( 2013 1 "Saturday" "second" meetup >date-only )
    [2013, 01, 12, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Saturday is another day in the middle of the second week"
    ( 2013 2 "Saturday" "second" meetup >date-only )
    [2013, 02, 09, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Sunday is some day in the middle of the second week"
    ( 2013 3 "Sunday" "second" meetup >date-only )
    [2013, 03, 10, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when second Sunday is the 14th, the last day of the second week"
    ( 2013 4 "Sunday" "second" meetup >date-only )
    [2013, 04, 14, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Monday is some day in the middle of the third week"
    ( 2013 3 "Monday" "third" meetup >date-only )
    [2013, 03, 18, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Monday is the 15th, the first day of the third week"
    ( 2013 4 "Monday" "third" meetup >date-only )
    [2013, 04, 15, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Tuesday is the 21st, the last day of the third week"
    ( 2013 5 "Tuesday" "third" meetup >date-only )
    [2013, 05, 21, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Tuesday is some day in the middle of the third week"
    ( 2013 6 "Tuesday" "third" meetup >date-only )
    [2013, 06, 18, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Wednesday is some day in the middle of the third week"
    ( 2013 7 "Wednesday" "third" meetup >date-only )
    [2013, 07, 17, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Wednesday is the 21st, the last day of the third week"
    ( 2013 8 "Wednesday" "third" meetup >date-only )
    [2013, 08, 21, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Thursday is some day in the middle of the third week"
    ( 2013 9 "Thursday" "third" meetup >date-only )
    [2013, 09, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Thursday is another day in the middle of the third week"
    ( 2013 10 "Thursday" "third" meetup >date-only )
    [2013, 10, 17, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Friday is the 15th, the first day of the third week"
    ( 2013 11 "Friday" "third" meetup >date-only )
    [2013, 11, 15, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Friday is some day in the middle of the third week"
    ( 2013 12 "Friday" "third" meetup >date-only )
    [2013, 12, 20, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Saturday is some day in the middle of the third week"
    ( 2013 1 "Saturday" "third" meetup >date-only )
    [2013, 01, 19, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Saturday is another day in the middle of the third week"
    ( 2013 2 "Saturday" "third" meetup >date-only )
    [2013, 02, 16, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Sunday is some day in the middle of the third week"
    ( 2013 3 "Sunday" "third" meetup >date-only )
    [2013, 03, 17, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when third Sunday is the 21st, the last day of the third week"
    ( 2013 4 "Sunday" "third" meetup >date-only )
    [2013, 04, 21, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Monday is some day in the middle of the fourth week"
    ( 2013 3 "Monday" "fourth" meetup >date-only )
    [2013, 03, 25, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Monday is the 22nd, the first day of the fourth week"
    ( 2013 4 "Monday" "fourth" meetup >date-only )
    [2013, 04, 22, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Tuesday is the 28th, the last day of the fourth week"
    ( 2013 5 "Tuesday" "fourth" meetup >date-only )
    [2013, 05, 28, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Tuesday is some day in the middle of the fourth week"
    ( 2013 6 "Tuesday" "fourth" meetup >date-only )
    [2013, 06, 25, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Wednesday is some day in the middle of the fourth week"
    ( 2013 7 "Wednesday" "fourth" meetup >date-only )
    [2013, 07, 24, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Wednesday is the 28th, the last day of the fourth week"
    ( 2013 8 "Wednesday" "fourth" meetup >date-only )
    [2013, 08, 28, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Thursday is some day in the middle of the fourth week"
    ( 2013 9 "Thursday" "fourth" meetup >date-only )
    [2013, 09, 26, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Thursday is another day in the middle of the fourth week"
    ( 2013 10 "Thursday" "fourth" meetup >date-only )
    [2013, 10, 24, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Friday is the 22nd, the first day of the fourth week"
    ( 2013 11 "Friday" "fourth" meetup >date-only )
    [2013, 11, 22, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Friday is some day in the middle of the fourth week"
    ( 2013 12 "Friday" "fourth" meetup >date-only )
    [2013, 12, 27, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Saturday is some day in the middle of the fourth week"
    ( 2013 1 "Saturday" "fourth" meetup >date-only )
    [2013, 01, 26, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Saturday is another day in the middle of the fourth week"
    ( 2013 2 "Saturday" "fourth" meetup >date-only )
    [2013, 02, 23, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Sunday is some day in the middle of the fourth week"
    ( 2013 3 "Sunday" "fourth" meetup >date-only )
    [2013, 03, 24, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when fourth Sunday is the 28th, the last day of the fourth week"
    ( 2013 4 "Sunday" "fourth" meetup >date-only )
    [2013, 04, 28, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Monday in a month with four Mondays"
    ( 2013 3 "Monday" "last" meetup >date-only )
    [2013, 03, 25, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Monday in a month with five Mondays"
    ( 2013 4 "Monday" "last" meetup >date-only )
    [2013, 04, 29, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Tuesday in a month with four Tuesdays"
    ( 2013 5 "Tuesday" "last" meetup >date-only )
    [2013, 05, 28, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Tuesday in another month with four Tuesdays"
    ( 2013 6 "Tuesday" "last" meetup >date-only )
    [2013, 06, 25, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Wednesday in a month with five Wednesdays"
    ( 2013 7 "Wednesday" "last" meetup >date-only )
    [2013, 07, 31, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Wednesday in a month with four Wednesdays"
    ( 2013 8 "Wednesday" "last" meetup >date-only )
    [2013, 08, 28, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Thursday in a month with four Thursdays"
    ( 2013 9 "Thursday" "last" meetup >date-only )
    [2013, 09, 26, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Thursday in a month with five Thursdays"
    ( 2013 10 "Thursday" "last" meetup >date-only )
    [2013, 10, 31, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Friday in a month with five Fridays"
    ( 2013 11 "Friday" "last" meetup >date-only )
    [2013, 11, 29, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Friday in a month with four Fridays"
    ( 2013 12 "Friday" "last" meetup >date-only )
    [2013, 12, 27, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Saturday in a month with four Saturdays"
    ( 2013 1 "Saturday" "last" meetup >date-only )
    [2013, 01, 26, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Saturday in another month with four Saturdays"
    ( 2013 2 "Saturday" "last" meetup >date-only )
    [2013, 02, 23, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Sunday in a month with five Sundays"
    ( 2013 3 "Sunday" "last" meetup >date-only )
    [2013, 03, 31, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Sunday in a month with four Sundays"
    ( 2013 4 "Sunday" "last" meetup >date-only )
    [2013, 04, 28, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when last Wednesday in February in a leap year is the 29th"
    ( 2012 2 "Wednesday" "last" meetup >date-only )
    [2012, 02, 29, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"last Wednesday in December that is also the last day of the year"
    ( 2014 12 "Wednesday" "last" meetup >date-only )
    [2014, 12, 31, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when last Sunday in February in a non-leap year is not the 29th"
    ( 2015 2 "Sunday" "last" meetup >date-only )
    [2015, 02, 22, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

"when first Friday is the 7th, the last day of the first week"
    ( 2012 12 "Friday" "first" meetup >date-only )
    [2012, 12, 07, 0, 0, 0, 0, 0, 0, 0] d:join
    equal?

end-of-tests
;with
