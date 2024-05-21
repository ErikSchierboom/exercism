"secret-handshake.8th" f:include
needs exercism/test
with: test
11 tests

"wink for 1"
    ( 1 commands )
    ["wink"]
    equal?

SKIP-REST-OF-TESTS

"double blink for 10"
    ( 2 commands )
    ["double blink"]
    equal?

"close your eyes for 100"
    ( 4 commands )
    ["close your eyes"]
    equal?

"jump for 1000"
    ( 8 commands )
    ["jump"]
    equal?

"combine two actions"
    ( 3 commands )
    ["wink", "double blink"]
    equal?

"reverse two actions"
    ( 19 commands )
    ["double blink", "wink"]
    equal?

"reversing one action gives the same action"
    ( 24 commands )
    ["jump"]
    equal?

"reversing no actions still gives no actions"
    ( 16 commands )
    []
    equal?

"all possible actions"
    ( 15 commands )
    ["wink", "double blink", "close your eyes", "jump"]
    equal?

"reverse all possible actions"
    ( 31 commands )
    ["jump", "close your eyes", "double blink", "wink"]
    equal?

"do nothing for zero"
    ( 0 commands )
    []
    equal?

end-of-tests
;with
