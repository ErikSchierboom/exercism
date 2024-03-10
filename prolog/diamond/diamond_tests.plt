pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(diamond).

    test(degenerate_case_with_a_single_a_row, condition(true)) :-
        diamond('A', Rows),
        Rows == ["A"].

    test(degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces, condition(true)) :-
        diamond('B', Rows),
        Rows == [
            " A ",
            "B B",
            " A "
        ].

    test(smallest_non_degenerate_case_with_odd_diamond_side_length, condition(true)) :-
        diamond('C', Rows),
        Rows == [
            "  A  ", 
            " B B ", 
            "C   C", 
            " B B ", 
            "  A  "
        ].

    test(smallest_non_degenerate_case_with_even_diamond_side_length, condition(true)) :-
        diamond('D', Rows),
        Rows == [
            "   A   ",
            "  B B  ",
            " C   C ",
            "D     D",
            " C   C ",
            "  B B  ",
            "   A   "
        ].

    test(largest_possible_diamond, condition(true)) :-
        diamond('Z', Rows),
        Rows == [
            "                         A                         ",
            "                        B B                        ",
            "                       C   C                       ",
            "                      D     D                      ",
            "                     E       E                     ",
            "                    F         F                    ",
            "                   G           G                   ",
            "                  H             H                  ",
            "                 I               I                 ",
            "                J                 J                ",
            "               K                   K               ",
            "              L                     L              ",
            "             M                       M             ",
            "            N                         N            ",
            "           O                           O           ",
            "          P                             P          ",
            "         Q                               Q         ",
            "        R                                 R        ",
            "       S                                   S       ",
            "      T                                     T      ",
            "     U                                       U     ",
            "    V                                         V    ",
            "   W                                           W   ",
            "  X                                             X  ",
            " Y                                               Y ",
            "Z                                                 Z",
            " Y                                               Y ",
            "  X                                             X  ",
            "   W                                           W   ",
            "    V                                         V    ",
            "     U                                       U     ",
            "      T                                     T      ",
            "       S                                   S       ",
            "        R                                 R        ",
            "         Q                               Q         ",
            "          P                             P          ",
            "           O                           O           ",
            "            N                         N            ",
            "             M                       M             ",
            "              L                     L              ",
            "               K                   K               ",
            "                J                 J                ",
            "                 I               I                 ",
            "                  H             H                  ",
            "                   G           G                   ",
            "                    F         F                    ",
            "                     E       E                     ",
            "                      D     D                      ",
            "                       C   C                       ",
            "                        B B                        ",
            "                         A                         "
        ].

:- end_tests(diamond).
