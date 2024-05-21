"spiral-matrix.8th" f:include
needs exercism/test
with: test
6 tests

"empty spiral"
    ( 0 spiral-matrix )
    []
    equal?

SKIP-REST-OF-TESTS

"trivial spiral"
    ( 1 spiral-matrix )
    [[1]]
    equal?

"spiral of size 2"
    ( 2 spiral-matrix )
    [
        [1, 2],
        [4, 3]
    ]
    equal?

"spiral of size 3"
    ( 3 spiral-matrix )
    [
        [1, 2, 3],
        [8, 9, 4],
        [7, 6, 5]
    ]
    equal?

"spiral of size 4"
    ( 4 spiral-matrix )
    [
        [1, 2, 3, 4],
        [12, 13, 14, 5],
        [11, 16, 15, 6],
        [10, 9, 8, 7]
    ]
    equal?

"spiral of size 5"
    ( 5 spiral-matrix )
    [
        [1, 2, 3, 4, 5], 
        [16, 17, 18, 19, 6], 
        [15, 24, 25, 20, 7], 
        [14, 23, 22, 21, 8], 
        [13, 12, 11, 10, 9]
    ]
    equal?

end-of-tests
;with
