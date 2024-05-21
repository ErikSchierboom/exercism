"matrix.8th" f:include
needs exercism/test
with: test
8 tests

"extract row from one number matrix"
    ( "1" 1 row )
    [1]
    equal?

SKIP-REST-OF-TESTS

"can extract row"
    ( "1 2\n3 4" 2 row )
    [3, 4]
    equal?

"extract row where numbers have different widths"
    ( "1 2\n10 20" 2 row )
    [10, 20]
    equal?

"can extract row from non-square matrix with no corresponding column"
    ( "1 2 3\n4 5 6\n7 8 9\n8 7 6" 4 row )
    [8, 7, 6]
    equal?

"extract column from one number matrix"
    ( "1" 1 column )
    [1]
    equal?

"can extract column"
    ( "1 2 3\n4 5 6\n7 8 9" 3 column )
    [3, 6, 9]
    equal?

"can extract column from non-square matrix with no corresponding row"
    ( "1 2 3 4\n5 6 7 8\n9 8 7 6" 4 column )
    [4, 8, 6]
    equal?

"extract column where numbers have different widths"
    ( "89 1903 3\n18 3 1\n9 4 800" 2 column )
    [1903, 3, 4]
    equal?

end-of-tests
;with
