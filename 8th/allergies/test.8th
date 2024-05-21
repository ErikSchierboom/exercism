"allergies.8th" f:include
needs exercism/test
with: test
50 tests

"not allergic to anything, including eggs"
    ( 0 "eggs" allergic-to? )
    false?

SKIP-REST-OF-TESTS

"allergic only to eggs"
    ( 1 "eggs" allergic-to? )
    true?

"allergic to eggs and something else"
    ( 3 "eggs" allergic-to? )
    true?

"allergic to something, but not eggs"
    ( 2 "eggs" allergic-to? )
    false?

"allergic to everything, including eggs"
    ( 255 "eggs" allergic-to? )
    true?

"not allergic to anything, including peanuts"
    ( 0 "peanuts" allergic-to? )
    false?

"allergic only to peanuts"
    ( 2 "peanuts" allergic-to? )
    true?

"allergic to peanuts and something else"
    ( 7 "peanuts" allergic-to? )
    true?

"allergic to something, but not peanuts"
    ( 5 "peanuts" allergic-to? )
    false?

"allergic to everything, including peanuts"
    ( 255 "peanuts" allergic-to? )
    true?

"not allergic to anything, including shellfish"
    ( 0 "shellfish" allergic-to? )
    false?

"allergic only to shellfish"
    ( 4 "shellfish" allergic-to? )
    true?

"allergic to shellfish and something else"
    ( 14 "shellfish" allergic-to? )
    true?

"allergic to something, but not shellfish"
    ( 10 "shellfish" allergic-to? )
    false?

"allergic to everything, including shellfish"
    ( 255 "shellfish" allergic-to? )
    true?

"not allergic to anything, including strawberries"
    ( 0 "strawberries" allergic-to? )
    false?

"allergic only to strawberries"
    ( 8 "strawberries" allergic-to? )
    true?

"allergic to strawberries and something else"
    ( 28 "strawberries" allergic-to? )
    true?

"allergic to something, but not strawberries"
    ( 20 "strawberries" allergic-to? )
    false?

"allergic to everything, including strawberries"
    ( 255 "strawberries" allergic-to? )
    true?

"not allergic to anything, including tomatoes"
    ( 0 "tomatoes" allergic-to? )
    false?

"allergic only to tomatoes"
    ( 16 "tomatoes" allergic-to? )
    true?

"allergic to tomatoes and something else"
    ( 56 "tomatoes" allergic-to? )
    true?

"allergic to something, but not tomatoes"
    ( 40 "tomatoes" allergic-to? )
    false?

"allergic to everything, including tomatoes"
    ( 255 "tomatoes" allergic-to? )
    true?

"not allergic to anything, including chocolate"
    ( 0 "chocolate" allergic-to? )
    false?

"allergic only to chocolate"
    ( 32 "chocolate" allergic-to? )
    true?

"allergic to chocolate and something else"
    ( 112 "chocolate" allergic-to? )
    true?

"allergic to something, but not chocolate"
    ( 80 "chocolate" allergic-to? )
    false?

"allergic to everything, including chocolate"
    ( 255 "chocolate" allergic-to? )
    true?

"not allergic to anything, including pollen"
    ( 0 "pollen" allergic-to? )
    false?

"allergic only to pollen"
    ( 64 "pollen" allergic-to? )
    true?

"allergic to pollen and something else"
    ( 224 "pollen" allergic-to? )
    true?

"allergic to something, but not pollen"
    ( 160 "pollen" allergic-to? )
    false?

"allergic to everything, including pollen"
    ( 255 "pollen" allergic-to? )
    true?

"not allergic to anything, including cats"
    ( 0 "cats" allergic-to? )
    false?

"allergic only to cats"
    ( 128 "cats" allergic-to? )
    true?

"allergic to cats and something else"
    ( 192 "cats" allergic-to? )
    true?

"allergic to something, but not cats"
    ( 64 "cats" allergic-to? )
    false?

"allergic to everything, including cats"
    ( 255 "cats" allergic-to? )
    true?

"no allergies"
    ( 0 list )
    []
    equal?

"just eggs"
    ( 1 list )
    ["eggs"]
    equal?

"just peanuts"
    ( 2 list )
    ["peanuts"]
    equal?

"just strawberries"
    ( 8 list )
    ["strawberries"]
    equal?

"eggs and peanuts"
    ( 3 list )
    ["eggs", "peanuts"]
    equal?

"more than eggs but not peanuts"
    ( 5 list )
    ["eggs", "shellfish"]
    equal?

"lots of stuff"
    ( 248 list )
    ["strawberries", "tomatoes", "chocolate", "pollen", "cats"]
    equal?

"everything"
    ( 255 list )
    ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
    equal?

"no allergen score parts"
    ( 509 list )
    ["eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
    equal?

"no allergen score parts without highest valid score"
    ( 257 list )
    ["eggs"]
    equal?

end-of-tests
;with
