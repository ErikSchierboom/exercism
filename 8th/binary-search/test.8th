"binary-search.8th" f:include
needs exercism/test
with: test
11 tests

"finds a value in an array with one element"
    ( [6] 6 find )
    0
    equal?

SKIP-REST-OF-TESTS

"finds a value in the middle of an array"
    ( [1, 3, 4, 6, 8, 9, 11] 6 find )
    3
    equal?

"finds a value at the beginning of an array"
    ( [1, 3, 4, 6, 8, 9, 11] 1 find )
    0
    equal?

"finds a value at the end of an array"
    ( [1, 3, 4, 6, 8, 9, 11] 11 find )
    6
    equal?

"finds a value in an array of odd length"
    ( [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634] 144 find )
    9
    equal?

"finds a value in an array of even length"
    ( [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377] 21 find )
    5
    equal?

"identifies that a value is not included in the array"
    ( [1, 3, 4, 6, 8, 9, 11] 7 find )
    null?

"a value smaller than the array's smallest value is not found"
    ( [1, 3, 4, 6, 8, 9, 11] 0 find )
    null?

"a value larger than the array's largest value is not found"
    ( [1, 3, 4, 6, 8, 9, 11] 13 find )
    null?

"nothing is found in an empty array"
    ( [] 1 find )
    null?

"nothing is found when the left and right bounds cross"
    ( [1, 2] 0 find )
    null?

end-of-tests
;with
