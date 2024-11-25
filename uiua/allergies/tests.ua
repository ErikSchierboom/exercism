~ "allergies.ua" ~ IsAllergicTo List

# not allergic to anything, including eggs
⍤⤙≍ 0 IsAllergicTo 0 "eggs"

# allergic only to eggs
⍤⤙≍ 1 IsAllergicTo 1 "eggs"

# allergic to eggs and something else
⍤⤙≍ 1 IsAllergicTo 3 "eggs"

# allergic to something, but not eggs
⍤⤙≍ 0 IsAllergicTo 2 "eggs"

# allergic to everything, including eggs
⍤⤙≍ 1 IsAllergicTo 255 "eggs"

# not allergic to anything, including peanuts
⍤⤙≍ 0 IsAllergicTo 0 "peanuts"

# allergic only to peanuts
⍤⤙≍ 1 IsAllergicTo 2 "peanuts"

# allergic to peanuts and something else
⍤⤙≍ 1 IsAllergicTo 7 "peanuts"

# allergic to something, but not peanuts
⍤⤙≍ 0 IsAllergicTo 5 "peanuts"

# allergic to everything, including peanuts
⍤⤙≍ 1 IsAllergicTo 255 "peanuts"

# not allergic to anything, including shellfish
⍤⤙≍ 0 IsAllergicTo 0 "shellfish"

# allergic only to shellfish
⍤⤙≍ 1 IsAllergicTo 4 "shellfish"

# allergic to shellfish and something else
⍤⤙≍ 1 IsAllergicTo 14 "shellfish"

# allergic to something, but not shellfish
⍤⤙≍ 0 IsAllergicTo 10 "shellfish"

# allergic to everything, including shellfish
⍤⤙≍ 1 IsAllergicTo 255 "shellfish"

# not allergic to anything, including strawberries
⍤⤙≍ 0 IsAllergicTo 0 "strawberries"

# allergic only to strawberries
⍤⤙≍ 1 IsAllergicTo 8 "strawberries"

# allergic to strawberries and something else
⍤⤙≍ 1 IsAllergicTo 28 "strawberries"

# allergic to something, but not strawberries
⍤⤙≍ 0 IsAllergicTo 20 "strawberries"

# allergic to everything, including strawberries
⍤⤙≍ 1 IsAllergicTo 255 "strawberries"

# not allergic to anything, including tomatoes
⍤⤙≍ 0 IsAllergicTo 0 "tomatoes"

# allergic only to tomatoes
⍤⤙≍ 1 IsAllergicTo 16 "tomatoes"

# allergic to tomatoes and something else
⍤⤙≍ 1 IsAllergicTo 56 "tomatoes"

# allergic to something, but not tomatoes
⍤⤙≍ 0 IsAllergicTo 40 "tomatoes"

# allergic to everything, including tomatoes
⍤⤙≍ 1 IsAllergicTo 255 "tomatoes"

# not allergic to anything, including chocolate
⍤⤙≍ 0 IsAllergicTo 0 "chocolate"

# allergic only to chocolate
⍤⤙≍ 1 IsAllergicTo 32 "chocolate"

# allergic to chocolate and something else
⍤⤙≍ 1 IsAllergicTo 112 "chocolate"

# allergic to something, but not chocolate
⍤⤙≍ 0 IsAllergicTo 80 "chocolate"

# allergic to everything, including chocolate
⍤⤙≍ 1 IsAllergicTo 255 "chocolate"

# not allergic to anything, including pollen
⍤⤙≍ 0 IsAllergicTo 0 "pollen"

# allergic only to pollen
⍤⤙≍ 1 IsAllergicTo 64 "pollen"

# allergic to pollen and something else
⍤⤙≍ 1 IsAllergicTo 224 "pollen"

# allergic to something, but not pollen
⍤⤙≍ 0 IsAllergicTo 160 "pollen"

# allergic to everything, including pollen
⍤⤙≍ 1 IsAllergicTo 255 "pollen"

# not allergic to anything, including cats
⍤⤙≍ 0 IsAllergicTo 0 "cats"

# allergic only to cats
⍤⤙≍ 1 IsAllergicTo 128 "cats"

# allergic to cats and something else
⍤⤙≍ 1 IsAllergicTo 192 "cats"

# allergic to something, but not cats
⍤⤙≍ 0 IsAllergicTo 64 "cats"

# allergic to everything, including cats
⍤⤙≍ 1 IsAllergicTo 255 "cats"

# no allergies?
⍤⤙≍ {} List 0

# just eggs?
⍤⤙≍ {"eggs"} List 1

# just peanuts?
⍤⤙≍ {"peanuts"} List 2

# just strawberries?
⍤⤙≍ {"strawberries"} List 8

# eggs and peanuts?
⍤⤙≍ {"eggs" "peanuts"} List 3

# more than eggs but not peanuts?
⍤⤙≍ {"eggs" "shellfish"} List 5

# lots of stuff?
⍤⤙≍ {"strawberries" "tomatoes" "chocolate" "pollen" "cats"} List 248

# everything?
⍤⤙≍ {"eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats"} List 255

# no allergen score parts?
⍤⤙≍ {"eggs" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats"} List 509

# no allergen score parts without highest valid score?
⍤⤙≍ {"eggs"} List 257
