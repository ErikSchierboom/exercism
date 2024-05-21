"dnd-character.8th" f:include
needs exercism/test
with: test
18 tests

"ability modifier for score 3 is -4"
    ( 3 modifier )
    -4
    equal?

SKIP-REST-OF-TESTS

"ability modifier for score 4 is -3"
    ( 4 modifier )
    -3
    equal?

"ability modifier for score 5 is -3"
    ( 5 modifier )
    -3
    equal?

"ability modifier for score 6 is -2"
    ( 6 modifier )
    -2
    equal?

"ability modifier for score 7 is -2"
    ( 7 modifier )
    -2
    equal?

"ability modifier for score 8 is -1"
    ( 8 modifier )
    -1
    equal?

"ability modifier for score 9 is -1"
    ( 9 modifier )
    -1
    equal?

"ability modifier for score 10 is 0"
    ( 10 modifier )
    0
    equal?

"ability modifier for score 11 is 0"
    ( 11 modifier )
    0
    equal?

"ability modifier for score 12 is +1"
    ( 12 modifier )
    1
    equal?

"ability modifier for score 13 is +1"
    ( 13 modifier )
    1
    equal?

"ability modifier for score 14 is +2"
    ( 14 modifier )
    2
    equal?

"ability modifier for score 15 is +2"
    ( 15 modifier )
    2
    equal?

"ability modifier for score 16 is +3"
    ( 16 modifier )
    3
    equal?

"ability modifier for score 17 is +3"
    ( 17 modifier )
    3
    equal?

"ability modifier for score 18 is +4"
    ( 18 modifier )
    4
    equal?

: ability-valid? \ n -- t
    3 18 n:between
;

"random ability is within range"
    ( ability ability-valid? )
    true?

"random character is valid"
    ( character >r
      r@ "strength"     m:@ ability-valid? nip       
      r@ "dexterity"    m:@ ability-valid? nip and
      r@ "constitution" m:@ ability-valid? nip and
      r@ "intelligence" m:@ ability-valid? nip and
      r@ "wisdom"       m:@ ability-valid? nip and
      r@ "charisma"     m:@ ability-valid? nip and       
      r@ "constitution" m:@ nip modifier 10 n:+ r> "hitpoints" m:@ nip n:= and
    )    
    true?

end-of-tests
;with
