"list-ops.8th" f:include
needs exercism/test
with: test
22 tests

"empty lists"
    ( [] [] append )
    []
    equal?

SKIP-REST-OF-TESTS

"list to empty list"
    ( [] [1, 2, 3, 4] append )
    [1, 2, 3, 4]
    equal?

"empty list to list"
    ( [1, 2, 3, 4] [] append )
    [1, 2, 3, 4]
    equal?

"non-empty lists"
    ( [1, 2] [2, 3, 4, 5] append )
    [1, 2, 2, 3, 4, 5]
    equal?

"empty list"
    ( [] concat )
    []
    equal?

"list of lists"
    ( [[1, 2], [3], [], [4, 5, 6]] concat )
    [1, 2, 3, 4, 5, 6]
    equal?

"list of nested lists"
    ( [[[1], [2]], [[3]], [[]], [[4, 5, 6]]] concat )
    [[1], [2], [3], [], [4, 5, 6]]
    equal?

: odd? \ n -- T
    2 n:/mod drop 1 n:=
;

"empty list"
    ( [] ' odd? filter )
    []
    equal?

"non-empty list"
    ( [1, 2, 3, 5] ' odd? filter )
    [1, 3, 5]
    equal?

"empty list"
    ( [] length )
    0
    equal?

"non-empty list"
    ( [1, 2, 3, 4] length )
    4
    equal?

"empty list"
    ( [] ' n:1+ map )
    []
    equal?

"non-empty list"
    ( [1, 3, 5, 7] ' n:1+ map )
    [2, 4, 6, 8]
    equal?

"empty list"
    ( [] 2 ' n:* foldl )
    2
    equal?

"direction independent function applied to non-empty list"
    ( [1, 2, 3, 4] 5 ' n:+ foldl )
    15
    equal?

"direction dependent function applied to non-empty list"
    ( [1, 2, 3, 4] 24 ( swap n:/ ) foldl )
    64
    equal?

"empty list"
    ( [] 2 ' n:* foldr )
    2
    equal?

"direction independent function applied to non-empty list"
    ( [1, 2, 3, 4] 5 ' n:+ foldr )
    15
    equal?

"direction dependent function applied to non-empty list"
    ( [1, 2, 3, 4] 24 ( swap n:/ ) foldr )
    9
    equal?

"empty list"
    ( [] reverse )
    []
    equal?

"non-empty list"
    ( [1, 3, 5, 7] reverse )
    [7, 5, 3, 1]
    equal?

"list of lists is not flattened"
    ( [[1, 2], [3], [], [4, 5, 6]] reverse )
    [[4, 5, 6], [], [3], [1, 2]]
    equal?

end-of-tests
;with
