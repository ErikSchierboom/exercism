pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(minesweeper).

    test(no_rows, condition(true)) :-
        annotate([], Annotated),
        Annotated == [].

    test(no_columns, condition(pending)) :-
        annotate([""], Annotated),
        Annotated == [""].

    test(no_mines, condition(pending)) :-
        Board = [
            "   ", 
            "   ",
            "   "
        ],
        annotate(Board, Annotated),
        Annotated == [
            "   ",
            "   ",
            "   "
        ].

    test(minefield_with_only_mines, condition(pending)) :-
        Board = [
            "***",
            "***",
            "***"
        ],
        annotate(Board, Annotated),
        Annotated == [
            "***",
            "***",
            "***"
        ].

    test(mine_surrounded_by_spaces, condition(pending)) :-
        Board = [
            "   ",
            " * ",
            "   "
        ],
        annotate(Board, Annotated),
        Annotated == [
            "111",
            "1*1",
            "111"
        ].

    test(space_surrounded_by_mines, condition(pending)) :-
        Board = [
            "***",
            "* *",
            "***"
        ],
        annotate(Board, Annotated),
        Annotated == [
            "***", 
            "*8*", 
            "***"
        ].

    test(horizontal_line, condition(pending)) :-
        Board = [" * * "],
        annotate(Board, Annotated),
        Annotated == ["1*2*1"].

    test(horizontal_line_mines_at_edges, condition(pending)) :-
        Board = ["*   *"],
        annotate(Board, Annotated),
        Annotated == ["*1 1*"].

    test(vertical_line, condition(pending)) :-
        Board = [
            " ",
            "*",
            " ",
            "*",
            " "
        ],
        annotate(Board, Annotated),
        Annotated == [
            "1",
            "*",
            "2",
            "*",
            "1"
        ].

    test(vertical_line_mines_at_edges, condition(pending)) :-
        Board = [
            "*",
            " ",
            " ",
            " ",
            "*"
        ],
        annotate(Board, Annotated),
        Annotated == [
            "*",
            "1",
            " ",
            "1",
            "*"
        ].

    test(cross, condition(pending)) :-
        Board = [
            "  *  ",
            "  *  ", 
            "*****",
            "  *  ",
            "  *  "
        ],
        annotate(Board, Annotated),
        Annotated == [
            " 2*2 ",
            "25*52",
            "*****",
            "25*52",
            " 2*2 "
        ].

    test(large_minefield, condition(pending)) :-
        Board = [
            " *  * ",
            "  *   ",
            "    * ",
            "   * *",
            " *  * ",
            "      "
        ],
        annotate(Board, Annotated),
        Annotated == [
            "1*22*1",
            "12*322",
            " 123*2",
            "112*4*",
            "1*22*2",
            "111111"
        ].

:- end_tests(minesweeper).
