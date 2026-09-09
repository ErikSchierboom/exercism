~ "save-the-cow.ua" ~ Guess

# Initially 9 failures are allowed and no letters are guessed
⍤⤙≍ {"Ongoing" "@____" 9} Guess "" "loot"

# After 10 failures the game is over
⍤⤙≍ {"Lose" "@____" 0} Guess "abcdefghij" "loot"

# Losing with several correct guesses
⍤⤙≍ {"Lose" "@_oot" 0} Guess "toabcdefghij" "loot"

# Feeding a correct letter removes underscores
⍤⤙≍ {"Ongoing" "@___t" 9} Guess "t" "loot"

# Feeding a correct letter twice counts as a failure
⍤⤙≍ {"Ongoing" "@___t" 8} Guess "tt" "loot"

# Guessing a repeated letter reveals all instances
⍤⤙≍ {"Ongoing" "@_oot" 8} Guess "tto" "loot"

# Getting all the letters right makes for a win
⍤⤙≍ {"Win" "@loot" 8} Guess "ttol" "loot"

# Winning on the last guess is still a win
⍤⤙≍ {"Win" "@loot" 0} Guess "abcdefghitol" "loot"
