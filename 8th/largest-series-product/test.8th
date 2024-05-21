"largest-series-product.8th" f:include
needs exercism/test
with: test
15 tests

"finds the largest product if span equals length"
    ( "29" 2 largest-product )
    18
    equal?

SKIP-REST-OF-TESTS

"can find the largest product of 2 with numbers in order"
    ( "0123456789" 2 largest-product )
    72
    equal?

"can find the largest product of 2"
    ( "576802143" 2 largest-product )
    48
    equal?

"can find the largest product of 3 with numbers in order"
    ( "0123456789" 3 largest-product )
    504
    equal?

"can find the largest product of 3"
    ( "1027839564" 3 largest-product )
    270
    equal?

"can find the largest product of 5 with numbers in order"
    ( "0123456789" 5 largest-product )
    15120
    equal?

"can get the largest product of a big number"
    ( "73167176531330624919225119674426574742355349194934" 6 largest-product )
    23520
    equal?

"reports zero if the only digits are zero"
    ( "0000" 2 largest-product )
    0
    equal?

"reports zero if all spans include zero"
    ( "99099" 3 largest-product )
    0
    equal?

"rejects span longer than string length"
    ( "123" 4 largest-product )
    null?

"reports 1 for empty string and empty product (0 span)"
    ( "" 0 largest-product )
    1
    equal?

"reports 1 for nonempty string and empty product (0 span)"
    ( "123" 0 largest-product )
    1
    equal?

"rejects empty string and nonzero span"
    ( "" 1 largest-product )
    null?

"rejects invalid character in digits"
    ( "1234a5" 2 largest-product )
    null?

"rejects negative span"
    ( "12345" -1 largest-product )
    null?

end-of-tests
;with
