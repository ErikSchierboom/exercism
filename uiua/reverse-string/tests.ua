~ "reverse-string.ua" ~ ReverseString

# an empty string
⍤⤙≍ "" ReverseString ""

# a word
⍤⤙≍ "tobor" ReverseString "robot"

# a capitalized word
⍤⤙≍ "nemaR" ReverseString "Ramen"

# a sentence with punctuation
⍤⤙≍ "!yrgnuh m'I" ReverseString "I'm hungry!"

# a palindrome
⍤⤙≍ "racecar" ReverseString "racecar"

# an even-sized word
⍤⤙≍ "reward" ReverseString "drawer"
