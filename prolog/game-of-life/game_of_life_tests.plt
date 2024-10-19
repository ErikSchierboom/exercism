pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(game_of_life).

    test(empty_matrix, condition(true)) :-
        Current = [],
        tick(Current, Next),
        Next == [].

    test(live_cells_with_zero_live_neighbors_die, condition(true)) :-
        Current = [
            [0, 0, 0],
            [0, 1, 0],
            [0, 0, 0]
        ],
        tick(Current, Next),
        Next == [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ].

    test(live_cells_with_only_one_live_neighbor_die, condition(true)) :-
        Current = [
            [0, 0, 0],
            [0, 1, 0],
            [0, 1, 0]
        ],
        tick(Current, Next),
        Next == [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
        ].

    test(live_cells_with_two_live_neighbors_stay_alive, condition(true)) :-
        Current = [
            [1, 0, 1],
            [1, 0, 1],
            [1, 0, 1]
        ],
        tick(Current, Next),
        Next == [
            [0, 0, 0],
            [1, 0, 1],
            [0, 0, 0]
        ].

    test(live_cells_with_three_live_neighbors_stay_alive, condition(true)) :-
        Current = [
            [0, 1, 0],
            [1, 0, 0],
            [1, 1, 0]
        ],
        tick(Current, Next),
        Next == [
            [0, 0, 0],
            [1, 0, 0],
            [1, 1, 0]
        ].

    test(dead_cells_with_three_live_neighbors_become_alive, condition(true)) :-
        Current = [
            [1, 1, 0],
            [0, 0, 0],
            [1, 0, 0]
        ],
        tick(Current, Next),
        Next == [
            [0, 0, 0],
            [1, 1, 0],
            [0, 0, 0]
        ].

    test(live_cells_with_four_or_more_neighbors_die, condition(true)) :-
        Current = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ],
        tick(Current, Next),
        Next == [
            [1, 0, 1],
            [0, 0, 0],
            [1, 0, 1]
        ].

    test(bigger_matrix, condition(true)) :-
        Current = [
            [1, 1, 0, 1, 1, 0, 0, 0],
            [1, 0, 1, 1, 0, 0, 0, 0],
            [1, 1, 1, 0, 0, 1, 1, 1],
            [0, 0, 0, 0, 0, 1, 1, 0],
            [1, 0, 0, 0, 1, 1, 0, 0],
            [1, 1, 0, 0, 0, 1, 1, 1],
            [0, 0, 1, 0, 1, 0, 0, 1],
            [1, 0, 0, 0, 0, 0, 1, 1]
        ],
        tick(Current, Next),
        Next == [
            [1, 1, 0, 1, 1, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 1, 0],
            [1, 0, 1, 1, 1, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 1],
            [1, 1, 0, 0, 1, 0, 0, 1],
            [1, 1, 0, 1, 0, 0, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 1]
        ].

:- end_tests(game_of_life).
