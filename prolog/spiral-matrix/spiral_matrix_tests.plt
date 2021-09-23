pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(spiral).
    test(empty_spiral, condition(true)) :-
      spiral(0, []).

    test(trivial_spiral, condition(true)) :-
      spiral(1, [[1]]).
    test(spiral_of_size_2, condition(true)) :-
      spiral(2, [[1,2],
                 [4,3]]).
    test(spiral_of_size_3, condition(true)) :-
      spiral(3, [[1,2,3],
                 [8,9,4],
                 [7,6,5]]).
    test(spiral_of_size_4, condition(true)) :-
      spiral(4, [[ 1, 2, 3, 4],
                 [12,13,14, 5],
                 [11,16,15, 6],
                 [10, 9, 8, 7]]).
    test(spiral_of_size_5, condition(true)) :-
      spiral(5, [[ 1, 2, 3, 4, 5],
                 [16,17,18,19, 6],
                 [15,24,25,20, 7],
                 [14,23,22,21, 8],
                 [13,12,11,10, 9]]).
:- end_tests(spiral).
