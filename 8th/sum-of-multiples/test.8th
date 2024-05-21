"sum-of-multiples.8th" f:include
needs exercism/test
with: test
16 tests

"no multiples within limit"
    ( [3,5] 1 sum )
    0
    equal?

SKIP-REST-OF-TESTS

"one factor has multiples within limit"
    ( [3,5] 4 sum )
    3
    equal?

"more than one multiple within limit"
    ( [3] 7 sum )
    9
    equal?

"more than one factor with multiples within limit"
    ( [3,5] 10 sum )
    23
    equal?

"each multiple is only counted once"
    ( [3,5] 100 sum )
    2318
    equal?

"a much larger limit"
    ( [3,5] 1000 sum )
    233168
    equal?

"three factors"
    ( [7,13,17] 20 sum )
    51
    equal?

"factors not relatively prime"
    ( [4,6] 15 sum )
    30
    equal?

"some pairs of factors relatively prime and some not"
    ( [5,6,8] 150 sum )
    4419
    equal?

"one factor is a multiple of another"
    ( [5,25] 51 sum )
    275
    equal?

"much larger factors"
    ( [43,47] 10000 sum )
    2203160
    equal?

"all numbers are multiples of 1"
    ( [1] 100 sum )
    4950
    equal?

"no factors means an empty sum"
    ( [] 10000 sum )
    0
    equal?

"the only multiple of 0 is 0"
    ( [0] 1 sum )
    0
    equal?

"the factor 0 does not affect the sum of multiples of other factors"
    ( [3,0] 4 sum )
    3
    equal?

"solutions using include-exclude must extend to cardinality greater than 3"
    ( [2,3,5,7,11] 10000 sum )
    39614537
    equal?

end-of-tests
;with
