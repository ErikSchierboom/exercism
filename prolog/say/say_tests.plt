pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(say).

    test(zero, condition(true)) :-
        say(0, English),
        English == "zero".

    test(one, condition(pending)) :-
        say(1, English),
        English == "one".

    test(fourteen, condition(pending)) :-
        say(14, English),
        English == "fourteen".

    test(twenty, condition(pending)) :-
        say(20, English),
        English == "twenty".

    test(twenty_two, condition(pending)) :-
        say(22, English),
        English == "twenty-two".

    test(thirty, condition(pending)) :-
        say(30, English),
        English == "thirty".

    test(ninety_nine, condition(pending)) :-
        say(99, English),
        English == "ninety-nine".

    test(one_hundred, condition(pending)) :-
        say(100, English),
        English == "one hundred".

    test(one_hundred_twenty_three, condition(pending)) :-
        say(123, English),
        English == "one hundred twenty-three".

    test(two_hundred, condition(pending)) :-
        say(200, English),
        English == "two hundred".

    test(nine_hundred_ninety_nine, condition(pending)) :-
        say(999, English),
        English == "nine hundred ninety-nine".

    test(one_thousand, condition(pending)) :-
        say(1000, English),
        English == "one thousand".

    test(one_thousand_two_hundred_thirty_four, condition(pending)) :-
        say(1234, English),
        English == "one thousand two hundred thirty-four".

    test(one_million, condition(pending)) :-
        say(1000000, English),
        English == "one million".

    test(one_million_two_thousand_three_hundred_forty_five, condition(pending)) :-
        say(1002345, English),
        English == "one million two thousand three hundred forty-five".

    test(one_billion, condition(pending)) :-
        say(1000000000, English),
        English == "one billion".

    test(a_big_number, condition(pending)) :-
        say(987654321123, English),
        English == "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three".

    test(numbers_below_zero_are_out_of_range, [fail, condition(pending)]) :-
        say(-1, _).

    test(numbers_above_999_999_999_999_are_out_of_range, [fail, condition(pending)]) :-
        say(1000000000000, _).

:- end_tests(say).
