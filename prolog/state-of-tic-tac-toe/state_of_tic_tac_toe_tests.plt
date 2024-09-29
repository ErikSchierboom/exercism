pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\n_a TEST IS PENDING!\n'),
    fail.

:- begin_tests(state_of_tic_tac_toe).

    test(finished_game_where_x_won_via_left_column_victory, condition(true)) :-
        state(["XOO", "X  ", "X  "], State),
        State == win.
        
    test(finished_game_where_x_won_via_middle_column_victory, condition(true)) :-
        state(["OXO", " X ", " X "], State),
        State == win.
        
    test(finished_game_where_x_won_via_right_column_victory, condition(true)) :-
        state(["OOX", "  X", "  X"], State),
        State == win.
        
    test(finished_game_where_o_won_via_left_column_victory, condition(true)) :-
        state(["OXX", "OX ", "O  "], State),
        State == win.

    test(finished_game_where_o_won_via_middle_column_victory, condition(true)) :-
        state(["XOX", " OX", " O "], State),
        State == win.
        
    test(finished_game_where_o_won_via_right_column_victory, condition(true)) :-
        state(["XXO", " XO", "  O"], State),
        State == win.
        
    test(finished_game_where_x_won_via_top_row_victory, condition(true)) :-
        state(["XXX", "XOO", "O  "], State),
        State == win.

    test(finished_game_where_x_won_via_middle_row_victory, condition(true)) :-
        state(["O  ", "XXX", " O "], State),
        State == win.
        
    test(finished_game_where_x_won_via_bottom_row_victory, condition(true)) :-
        state([" OO", "O X", "XXX"], State),
        State == win.

    test(finished_game_where_o_won_via_top_row_victory, condition(true)) :-
        state(["OOO", "XXO", "XX "], State),
        State == win.

    test(finished_game_where_o_won_via_middle_row_victory, condition(true)) :-
        state(["XX ", "OOO", "X  "], State),
        State == win.
        
    test(finished_game_where_o_won_via_bottom_row_victory, condition(true)) :-
        state(["XOX", " XX", "OOO"], State),
        State == win.
        
    test(finished_game_where_x_won_via_falling_diagonal_victory, condition(true)) :-
        state(["XOO", " X ", "  X"], State),
        State == win.

    test(finished_game_where_x_won_via_rising_diagonal_victory, condition(true)) :-
        state(["O X", "OX ", "X  "], State),
        State == win.
        
    test(finished_game_where_o_won_via_falling_diagonal_victory, condition(true)) :-
        state(["OXX", "OOX", "X O"], State),
        State == win.

    test(finished_game_where_o_won_via_rising_diagonal_victory, condition(true)) :-
        state(["  O", " OX", "OXX"], State),
        State == win.

    test(finished_game_where_x_won_via_aRow_and_a_column_victory, condition(true)) :-
        state(["XXX", "XOO", "XOO"], State),
        State == win.

    test(finished_game_where_x_won_via_two_diagonal_victories, condition(true)) :-
        state(["XOX", "OXO", "XOX"], State),
        State == win.
        
    test(draw, condition(true)) :-
        state(["XOX", "XXO", "OXO"], State),
        State == draw.
        
    test(another_draw, condition(true)) :-
        state(["XXO", "OXX", "XOO"], State),
        State == draw.

    test(ongoing_game_one_move_in, condition(true)) :-
        state(["   ", "X  ", "   "], State),
        State == ongoing.
        
    test(ongoing_game_two_moves_in, condition(true)) :-
        state(["O  ", " X ", "   "], State),
        State == ongoing.

    test(ongoing_game_five_moves_in, condition(true)) :-
        state(["X  ", " XO", "OX "], State),
        State == ongoing.

    test(invalid_board_x_went_twice, [fail, condition(true)]) :-
        state(["XX ", "   ", "   "], _).
        
    test(invalid_board_o_started, [fail, condition(true)]) :-
        state(["OOX", "   ", "   "], _).

    test(invalid_board, [fail, condition(true)]) :-
        state(["XXX", "OOO", "   "], _).

    test(invalid_board_players_kept_playing_after_a_win, [fail, condition(true)]) :-
        state(["XXX", "OOO", "XOX"], _).

:- end_tests(state_of_tic_tac_toe).
