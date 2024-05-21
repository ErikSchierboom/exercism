"rotational-cipher.8th" f:include
needs exercism/test
with: test
10 tests

"rotate a by 0, same output as input"
    ( "a" 0 rotate )
    "a"
    equal?

SKIP-REST-OF-TESTS

"rotate a by 1"
    ( "a" 1 rotate )
    "b"
    equal?

"rotate a by 26, same output as input"
    ( "a" 26 rotate )
    "a"
    equal?

"rotate m by 13"
    ( "m" 13 rotate )
    "z"
    equal?

"rotate n by 13 with wrap around alphabet"
    ( "n" 13 rotate )
    "a"
    equal?

"rotate capital letters"
    ( "OMG" 5 rotate )
    "TRL"
    equal?

"rotate spaces"
    ( "O M G" 5 rotate )
    "T R L"
    equal?

"rotate numbers"
    ( "Testing 1 2 3 testing" 4 rotate )
    "Xiwxmrk 1 2 3 xiwxmrk"
    equal?

"rotate punctuation"
    ( "Let's eat, Grandma!" 21 rotate )
    "Gzo'n zvo, Bmviyhv!"
    equal?

"rotate all letters"
    ( "The quick brown fox jumps over the lazy dog." 13 rotate )
    "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    equal?

end-of-tests
;with
