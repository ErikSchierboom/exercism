pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(ocr_numbers).

    test(recognizes_0, condition(true)) :-
        Input = [
            " _ ",
            "| |",
            "|_|",
            "   "
        ],
        convert(Input, Output),
        Output == "0".

    test(recognizes_1, condition(pending)) :-
        Input = [
            "   ",
            "  |",
            "  |",
            "   "
        ],
        convert(Input, Output),
        Output == "1".

    test(recognizes_2, condition(pending)) :-
        Input = [
            " _ ",
            " _|",
            "|_ ",
            "   "
        ],
        convert(Input, Output),
        Output == "2".

    test(recognizes_3, condition(pending)) :-
        Input = [
            " _ ",
            " _|",
            " _|",
            "   "
        ],
        convert(Input, Output),
        Output == "3".

    test(recognizes_4, condition(pending)) :-
        Input = [
            "   ",
            "|_|",
            "  |",
            "   "
        ],
        convert(Input, Output),
        Output == "4".

    test(recognizes_5, condition(pending)) :-
        Input = [
            " _ ",
            "|_ ",
            " _|",
            "   "
        ],
        convert(Input, Output),
        Output == "5".

    test(recognizes_6, condition(pending)) :-
        Input = [
            " _ ",
            "|_ ",
            "|_|",
            "   "
        ],
        convert(Input, Output),
        Output == "6".

    test(recognizes_7, condition(pending)) :-
        Input = [
            " _ ",
            "  |",
            "  |",
            "   "
        ],
        convert(Input, Output),
        Output == "7".

    test(recognizes_8, condition(pending)) :-
        Input = [
            " _ ",
            "|_|",
            "|_|",
            "   "
        ],
        convert(Input, Output),
        Output == "8".

    test(recognizes_9, condition(pending)) :-
        Input = [
            " _ ",
            "|_|",
            " _|",
            "   "
        ],
        convert(Input, Output),
        Output == "9".
        
    test(unreadable_but_correctly_sized_inputs_return, condition(pending)) :-
        Input = [
            "   ",
            "  _",
            "  |",
            "   "
        ],
        convert(Input, Output),
        Output == "?".

    test(input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error, [fail, condition(pending)]) :-
        Input = [
            " _ ",
            "| |",
            "   "
        ],
        convert(Input, _).

    test(input_with_a_number_of_columns_that_is_not_a_multiple_of_three_raises_an_error, [fail, condition(pending)]) :-
        Input = [
            "    ",
            "   |",
            "   |",
            "    "
        ],
        convert(Input, _).

    test(recognizes_110101100, condition(pending)) :-
        Input = [
            "       _     _        _  _ ",
            "  |  || |  || |  |  || || |",
            "  |  ||_|  ||_|  |  ||_||_|",
            "                           "
        ],
        convert(Input, Output),
        Output == "110101100".

    test(recognizes_string_of_decimal_numbers, condition(pending)) :-
        Input = [
            "    _  _     _  _  _  _  _  _ ",
            "  | _| _||_||_ |_   ||_||_|| |",
            "  ||_  _|  | _||_|  ||_| _||_|",
            "                              "
        ],
        convert(Input, Output),
        Output == "1234567890".

    test(garbled_numbers_in_a_string_are_replaced_with, condition(pending)) :-
        Input = [
            "       _     _           _ ",
            "  |  || |  || |     || || |",
            "  |  | _|  ||_|  |  ||_||_|",
            "                           "
        ],
        convert(Input, Output),
        Output == "11?10?1?0".

    test(numbers_separated_by_empty_lines_are_recognized_lines_are_joined_by_commas, condition(pending)) :-
        Input = [
            "    _  _ ",
            "  | _| _|",
            "  ||_  _|",
            "         ",
            "    _  _ ",
            "|_||_ |_ ",
            "  | _||_|",
            "         ",
            " _  _  _ ",
            "  ||_||_|",
            "  ||_| _|",
            "         "
        ],
        convert(Input, Output),
        Output == "123,456,789".

:- end_tests(ocr_numbers).
