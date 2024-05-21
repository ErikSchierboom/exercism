"perfect-numbers.8th" f:include
needs exercism/test
with: test
13 tests

"Smallest perfect number is classified correctly"
    ( 6 classify )
    "perfect"
    equal?

SKIP-REST-OF-TESTS

"Medium perfect number is classified correctly"
    ( 28 classify )
    "perfect"
    equal?

"Large perfect number is classified correctly"
    ( 33550336 classify )
    "perfect"
    equal?

"Smallest abundant number is classified correctly"
    ( 12 classify )
    "abundant"
    equal?

"Medium abundant number is classified correctly"
    ( 30 classify )
    "abundant"
    equal?

"Large abundant number is classified correctly"
    ( 33550335 classify )
    "abundant"
    equal?

"Smallest prime deficient number is classified correctly"
    ( 2 classify )
    "deficient"
    equal?

"Smallest non-prime deficient number is classified correctly"
    ( 4 classify )
    "deficient"
    equal?

"Medium deficient number is classified correctly"
    ( 32 classify )
    "deficient"
    equal?

"Large deficient number is classified correctly"
    ( 33550337 classify )
    "deficient"
    equal?

"Edge case (no factors other than itself) is classified correctly"
    ( 1 classify )
    "deficient"
    equal?

"Zero is rejected (as it is not a positive integer)"
    ( 0 classify )
    null?

"Negative integer is rejected (as it is not a positive integer)"
    ( -1 classify )
    null?

end-of-tests
;with
