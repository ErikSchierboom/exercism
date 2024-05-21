"strain.8th" f:include
needs exercism/test
with: test
14 tests

"keep on empty list returns empty list"
    ( [] ( drop true ) keep )
    []
    equal?

SKIP-REST-OF-TESTS

"keeps everything"
    ( [1, 3, 5] ( drop true ) keep )
    [1, 3, 5]
    equal?

"keeps nothing"
    ( [1, 3, 5] ( drop false ) keep )
    []
    equal?

"keeps first and last"
    ( [1, 2, 3] ( 2 n:mod 1 n:= ) keep )
    [1, 3]
    equal?

"keeps neither first nor last"
    ( [1, 2, 3] ( 2 n:mod 0 n:= ) keep )
    [2]
    equal?

"keeps strings"
    ( ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"] ( 0 s:@ nip 'z n:= ) keep )
    ["zebra", "zombies", "zealot"]
    equal?

"keeps lists"
    ( [[1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5]] ( 5 ' n:= a:indexof nip number? nip ) keep )
    [[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]]
    equal?

"discard on empty list returns empty list"
    ( [] ( drop true ) discard )
    []
    equal?

"discards everything"
    ( [1, 3, 5] ( drop true ) discard )
    []
    equal?

"discards nothing"
    ( [1, 3, 5] ( drop false ) discard )
    [1, 3, 5]
    equal?

"discards first and last"
    ( [1, 2, 3] ( 2 n:mod 1 n:= ) discard )
    [2]
    equal?

"discards neither first nor last"
    ( [1, 2, 3] ( 2 n:mod 0 n:= ) discard )
    [1, 3]
    equal?

"discards strings"
    ( ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"] ( 0 s:@ nip 'z n:= ) discard )
    ["apple", "banana", "cherimoya"]
    equal?

"discards lists"
    ( [[1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5]] ( 5 ' n:= a:indexof nip number? nip ) discard )
    [[1, 2, 3], [2, 1, 2], [2, 2, 1]]
    equal?

end-of-tests
;with
