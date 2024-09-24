pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(magic_square).

    test(magic_square_order_3, condition(true)) :-
        Square = 
            [
                [2, 7, 6],
                [9, 5, 1],
                [4, 3, 8]
            ],
        magic_square(Square).

    test(magic_square_order_4, condition(true)) :-
        Square = 
            [
                [ 2, 16, 13,  3],
                [11,  5,  8, 10],
                [ 7,  9, 12,  6],
                [14,  4,  1, 15]
            ],
        magic_square(Square).

    test(magic_square_order_9, condition(true)) :-
        Square = 
            [
                [31, 76, 13, 36, 81, 18, 29, 74, 11],
                [22, 40, 58, 27, 45, 63, 20, 38, 56],
                [67,  4, 49, 72,  9, 54, 65,  2, 47],
                [30, 75, 12, 32, 77, 14, 34, 79, 16],
                [21, 39, 57, 23, 41, 59, 25, 43, 61],
                [66,  3, 48, 68,  5, 50, 70,  7, 52],
                [35, 80, 17, 28, 73, 10, 33, 78, 15],
                [26, 44, 62, 19, 37, 55, 24, 42, 60],
                [71,  8, 53, 64,  1, 46, 69,  6, 51]
            ],
        magic_square(Square).

    test(invalid_magic_square, [fail, condition(true)]) :-
        Square = 
            [
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]
            ],
        magic_square(Square).

:- end_tests(magic_square).
