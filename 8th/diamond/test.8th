"diamond.8th" f:include
needs exercism/test
with: test
5 tests

"Degenerate case with a single 'A' row"
    ( "A" rows )
    [
      "A"
    ]
    equal?

SKIP-REST-OF-TESTS

"Degenerate case with no row containing 3 distinct groups of spaces"
    ( "B" rows )
    [
      " A ",
      "B B",
      " A "
    ]
    equal?

"Smallest non-degenerate case with odd diamond side length"
    ( "C" rows )
    [
      "  A  ",
      " B B ",
      "C   C",
      " B B ",
      "  A  "
    ]
    equal?

"Smallest non-degenerate case with even diamond side length"
    ( "D" rows )
    [
      "   A   ",
      "  B B  ",
      " C   C ",
      "D     D",
      " C   C ",
      "  B B  ",
      "   A   "
    ]
    equal?

"Largest possible diamond"
    ( "Z" rows )
    [
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
    ]
    equal?

end-of-tests
;with
