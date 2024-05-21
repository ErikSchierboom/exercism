"phone-number.8th" f:include
needs exercism/test
with: test
18 tests

"cleans the number"
    ( "(223) 456-7890" clean )
    "2234567890"
    equal?

SKIP-REST-OF-TESTS

"cleans numbers with dots"
    ( "223.456.7890" clean )
    "2234567890"
    equal?

"cleans numbers with multiple spaces"
    ( "223 456   7890   " clean )
    "2234567890"
    equal?

"invalid when 9 digits"
    ( "123456789" clean )
    null?

"invalid when 11 digits does not start with a 1"
    ( "22234567890" clean )
    null?

"valid when 11 digits and starting with 1"
    ( "12234567890" clean )
    "2234567890"
    equal?

"valid when 11 digits and starting with 1 even with punctuation"
    ( "+1 (223) 456-7890" clean )
    "2234567890"
    equal?

"invalid when more than 11 digits"
    ( "321234567890" clean )
    null?

"invalid with letters"
    ( "523-abc-7890" clean )
    null?

"invalid with punctuations"
    ( "523-@:!-7890" clean )
    null?

"invalid if area code starts with 0"
    ( "(023) 456-7890" clean )
    null?

"invalid if area code starts with 1"
    ( "(123) 456-7890" clean )
    null?

"invalid if exchange code starts with 0"
    ( "(223) 056-7890" clean )
    null?

"invalid if exchange code starts with 1"
    ( "(223) 156-7890" clean )
    null?

"invalid if area code starts with 0 on valid 11-digit number"
    ( "1 (023) 456-7890" clean )
    null?

"invalid if area code starts with 1 on valid 11-digit number"
    ( "1 (123) 456-7890" clean )
    null?

"invalid if exchange code starts with 0 on valid 11-digit number"
    ( "1 (223) 056-7890" clean )
    null?

"invalid if exchange code starts with 1 on valid 11-digit number"
    ( "1 (223) 156-7890" clean )
    null?

end-of-tests
;with
