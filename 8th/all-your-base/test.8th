"all-your-base.8th" f:include
needs exercism/test
with: test
21 tests

"single bit one to decimal"
    ( 2 [1] 10 rebase )
    [1]
    equal?

SKIP-REST-OF-TESTS

"binary to single decimal"
    ( 2 [1, 0, 1] 10 rebase )
    [5]
    equal?

"single decimal to binary"
    ( 10 [5] 2 rebase )
    [1, 0, 1]
    equal?

"binary to multiple decimal"
    ( 2 [1, 0, 1, 0, 1, 0] 10 rebase )
    [4, 2]
    equal?

"decimal to binary"
    ( 10 [4, 2] 2 rebase )
    [1, 0, 1, 0, 1, 0]
    equal?

"trinary to hexadecimal"
    ( 3 [1, 1, 2, 0] 16 rebase )
    [2, 10]
    equal?

"hexadecimal to trinary"
    ( 16 [2, 10] 3 rebase )
    [1, 1, 2, 0]
    equal?

"15-bit integer"
    ( 97 [3, 46, 60] 73 rebase )
    [6, 10, 45]
    equal?

"empty list"
    ( 2 [] 10 rebase )
    [0]
    equal?

"single zero"
    ( 10 [0] 2 rebase )
    [0]
    equal?

"multiple zeros"
    ( 10 [0, 0, 0] 2 rebase )
    [0]
    equal?

"leading zeros"
    ( 7 [0, 6, 0] 10 rebase )
    [4, 2]
    equal?

"input base is one"
    ( 1 [0] 10 rebase )
    null?

"input base is zero"
    ( 0 [] 10 rebase )
    null?

"input base is negative"
    ( -2 [1] 10 rebase )
    null?

"negative digit"
    ( 2 [1, -1, 1, 0, 1, 0] 10 rebase )
    null?

"invalid positive digit"
    ( 2 [1, 2, 1, 0, 1, 0] 10 rebase )
    null?

"output base is one"
    ( 2 [1, 0, 1, 0, 1, 0] 1 rebase )
    null?

"output base is zero"
    ( 10 [7] 0 rebase )
    null?

"output base is negative"
    ( 2 [1] -7 rebase )
    null?

"both bases are negative"
    ( -2 [1] -7 rebase )
    null?

end-of-tests
;with
