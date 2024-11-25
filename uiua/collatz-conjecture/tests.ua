~ "collatz-conjecture.ua" ~ Steps

# zero steps for one?
⍤⤙≍ 0 Steps 1

# even and odd steps?
⍤⤙≍ 9 Steps 12

# divide if even?
⍤⤙≍ 4 Steps 16

# zero is an error
⍤⤙≍ "only positive integers are allowed" ⍣(Steps 0)

# negative value is an error
⍤⤙≍ "only positive integers are allowed" ⍣(Steps ¯15)
