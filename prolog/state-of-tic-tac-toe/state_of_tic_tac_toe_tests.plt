pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\n_a TEST IS PENDING!\n'),
    fail.

:- begin_tests(state_of_tic_tac_toe).

    test(finished_game_where_x_won_via_left_column_victory, condition(true)) :-
        state(["XOO", "X  ", "X  "], State),
        State == win.
        
    test(finished_game_where_x_won_via_middle_column_victory, condition(pending)) :-
        state(["OXO", " X ", " X "], State),
        State == win.
        
    test(finished_game_where_x_won_via_right_column_victory, condition(pending)) :-
        state(["OOX", "  X", "  X"], State),
        State == win.
        
    test(finished_game_where_o_won_via_left_column_victory, condition(pending)) :-
        state(["OXX", "OX ", "O  "], State),
        State == win.

    test(finished_game_where_o_won_via_middle_column_victory, condition(pending)) :-
        state(["XOX", " OX", " O "], State),
        State == win.
        
    test(finished_game_where_o_won_via_right_column_victory, condition(pending)) :-
        state(["XXO", " XO", "  O"], State),
        State == win.
        
    test(finished_game_where_x_won_via_top_row_victory, condition(pending)) :-
        state(["XXX", "XOO", "O  "], State),
        State == win.

    test(finished_game_where_x_won_via_middle_row_victory, condition(pending)) :-
        state(["O  ", "XXX", " O "], State),
        State == win.
        
    test(finished_game_where_x_won_via_bottom_row_victory, condition(pending)) :-
        state([" OO", "O X", "XXX"], State),
        State == win.

    test(finished_game_where_o_won_via_top_row_victory, condition(pending)) :-
        state(["OOO", "XXO", "XX "], State),
        State == win.

    test(finished_game_where_o_won_via_middle_row_victory, condition(pending)) :-
        state(["XX ", "OOO", "X  "], State),
        State == win.
        
    test(finished_game_where_o_won_via_bottom_row_victory, condition(pending)) :-
        state(["XOX", " XX", "OOO"], State),
        State == win.
        
    test(finished_game_where_x_won_via_falling_diagonal_victory, condition(pending)) :-
        state(["XOO", " X ", "  X"], State),
        State == win.

    test(finished_game_where_x_won_via_rising_diagonal_victory, condition(pending)) :-
        state(["O X", "OX ", "X  "], State),
        State == win.
        
    test(finished_game_where_o_won_via_falling_diagonal_victory, condition(pending)) :-
        state(["OXX", "OOX", "X O"], State),
        State == win.

    test(finished_game_where_o_won_via_rising_diagonal_victory, condition(pending)) :-
        state(["  O", " OX", "OXX"], State),
        State == win.

    test(finished_game_where_x_won_via_aRow_and_a_column_victory, condition(pending)) :-
        state(["XXX", "XOO", "XOO"], State),
        State == win.

    test(finished_game_where_x_won_via_two_diagonal_victories, condition(pending)) :-
        state(["XOX", "OXO", "XOX"], State),
        State == win.
        
    test(draw, condition(pending)) :-
        state(["XOX", "XXO", "OXO"], State),
        State == draw.
        
    test(another_draw, condition(pending)) :-
        state(["XXO", "OXX", "XOO"], State),
        State == draw.

    test(ongoing_game_one_move_in, condition(pending)) :-
        state(["   ", "X  ", "   "], State),
        State == ongoing.
        
    test(ongoing_game_two_moves_in, condition(pending)) :-
        state(["O  ", " X ", "   "], State),
        State == ongoing.

    test(ongoing_game_five_moves_in, condition(pending)) :-
        state(["X  ", " XO", "OX "], State),
        State == ongoing.

    test(invalid_board_x_went_twice, [fail, condition(pending)]) :-
        state(["XX ", "   ", "   "], _).
        
    test(invalid_board_o_started, [fail, condition(pending)]) :-
        state(["OOX", "   ", "   "], _).

    test(invalid_board, [fail, condition(pending)]) :-
        state(["XXX", "OOO", "   "], _).

    test(invalid_board_players_kept_playing_after_a_win, [fail, condition(pending)]) :-
        state(["XXX", "OOO", "XOX"], _).

:- end_tests(state_of_tic_tac_toe).
