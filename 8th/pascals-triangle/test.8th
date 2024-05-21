"pascals-triangle.8th" f:include
needs exercism/test
with: test
8 tests

"zero rows"
    ( 0 rows )
    []
    equal?

SKIP-REST-OF-TESTS

"single row"
    ( 1 rows )
    [[1]]
    equal?

"two rows"
    ( 2 rows )
    [[1], [1, 1]]
    equal?

"three rows"
    ( 3 rows )
    [[1], [1, 1], [1, 2, 1]]
    equal?

"four rows"
    ( 4 rows )
    [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
    equal?

"five rows"
    ( 5 rows )
    [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
    equal?

"six rows"
    ( 6 rows )
    [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]
    equal?

"ten rows"
    ( 10 rows )
    [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]]
    equal?

end-of-tests
;with
