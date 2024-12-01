~ "secret-handshake.ua" ~ Commands

# wink for 1
⍤⤙≍ {"wink"} Commands 1

# double blink for 10
⍤⤙≍ {"double blink"} Commands 2

# close your eyes for 100
⍤⤙≍ {"close your eyes"} Commands 4

# jump for 1000
⍤⤙≍ {"jump"} Commands 8

# combine two actions
⍤⤙≍ {"wink" "double blink"} Commands 3

# reverse two actions
⍤⤙≍ {"double blink" "wink"} Commands 19

# reversing one action gives the same action
⍤⤙≍ {"jump"} Commands 24

# reversing no actions still gives no actions
⍤⤙≍ {} Commands 16

# all possible actions
⍤⤙≍ {"wink" "double blink" "close your eyes" "jump"} Commands 15

# reverse all possible actions
⍤⤙≍ {"jump" "close your eyes" "double blink" "wink"} Commands 31

# do nothing for zero
⍤⤙≍ {} Commands 0
