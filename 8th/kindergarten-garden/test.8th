"kindergarten-garden.8th" f:include
needs exercism/test
with: test
17 tests

"garden with single student"
    ( "RC\nGG" "Alice" plants )
    ["radishes", "clover", "grass", "grass"]
    equal?

SKIP-REST-OF-TESTS

"different garden with single student"
    ( "VC\nRC" "Alice" plants )
    ["violets", "clover", "radishes", "clover"]
    equal?

"garden with two students"
    ( "VVCG\nVVRC" "Bob" plants )
    ["clover", "grass", "radishes", "clover"]
    equal?

"second student's garden"
    ( "VVCCGG\nVVCCGG" "Bob" plants )
    ["clover", "clover", "clover", "clover"]
    equal?

"third student's garden"
    ( "VVCCGG\nVVCCGG" "Charlie" plants )
    ["grass", "grass", "grass", "grass"]
    equal?

"for Alice, first student's garden"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Alice" plants )
    ["violets", "radishes", "violets", "radishes"]
    equal?

"for Bob, second student's garden"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Bob" plants )
    ["clover", "grass", "clover", "clover"]
    equal?

"for Charlie"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Charlie" plants )
    ["violets", "violets", "clover", "grass"]
    equal?

"for David"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "David" plants )
    ["radishes", "violets", "clover", "radishes"]
    equal?

"for Eve"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Eve" plants )
    ["clover", "grass", "radishes", "grass"]
    equal?

"for Fred"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Fred" plants )
    ["grass", "clover", "violets", "clover"]
    equal?

"for Ginny"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ginny" plants )
    ["clover", "grass", "grass", "clover"]
    equal?

"for Harriet"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Harriet" plants )
    ["violets", "radishes", "radishes", "violets"]
    equal?

"for Ileana"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ileana" plants )
    ["grass", "clover", "violets", "clover"]
    equal?

"for Joseph"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Joseph" plants )
    ["violets", "clover", "violets", "grass"]
    equal?

"for Kincaid, second to last student's garden"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Kincaid" plants )
    ["grass", "clover", "clover", "grass"]
    equal?

"for Larry, last student's garden"
    ( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Larry" plants )
    ["grass", "violets", "clover", "violets"]
    equal?

end-of-tests
;with
