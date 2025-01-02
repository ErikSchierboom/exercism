~ "state-of-tic-tac-toe.ua" ~ GameState

# Finished game where X won via left column victory
Board ← [
  "XOO"
  "X  "
  "X  "
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via middle column victory
Board ← [
  "OXO"
  " X "
  " X "
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via right column victory
Board ← [
  "OOX"
  "  X"
  "  X"
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via left column victory
Board ← [
  "OXX"
  "OX "
  "O  "
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via middle column victory
Board ← [
  "XOX"
  " OX"
  " O "
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via right column victory
Board ← [
  "XXO"
  " XO"
  "  O"
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via top row victory
Board ← [
  "XXX"
  "XOO"
  "O  "
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via middle row victory
Board ← [
  "O  "
  "XXX"
  " O "
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via bottom row victory
Board ← [
  " OO"
  "O X"
  "XXX"
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via top row victory
Board ← [
  "OOO"
  "XXO"
  "XX "
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via middle row victory
Board ← [
  "XX "
  "OOO"
  "X  "
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via bottom row victory
Board ← [
  "XOX"
  " XX"
  "OOO"
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via falling diagonal victory
Board ← [
  "XOO"
  " X "
  "  X"
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via rising diagonal victory
Board ← [
  "O X"
  "OX "
  "X  "
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via falling diagonal victory
Board ← [
  "OXX"
  "OOX"
  "X O"
]
⍤⤙≍ "win" GameState Board

# Finished game where O won via rising diagonal victory
Board ← [
  "  O"
  " OX"
  "OXX"
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via a row and a column victory
Board ← [
  "XXX"
  "XOO"
  "XOO"
]
⍤⤙≍ "win" GameState Board

# Finished game where X won via two diagonal victories
Board ← [
  "XOX"
  "OXO"
  "XOX"
]
⍤⤙≍ "win" GameState Board

# Draw
Board ← [
  "XOX"
  "XXO"
  "OXO"
]
⍤⤙≍ "draw" GameState Board

# Another draw
Board ← [
  "XXO"
  "OXX"
  "XOO"
]
⍤⤙≍ "draw" GameState Board

# Ongoing game: one move in
Board ← [
  "   "
  "X  "
  "   "
]
⍤⤙≍ "ongoing" GameState Board

# Ongoing game: two moves in
Board ← [
  "O  "
  " X "
  "   "
]
⍤⤙≍ "ongoing" GameState Board

# Ongoing game: five moves in
Board ← [
  "X  "
  " XO"
  "OX "
]
⍤⤙≍ "ongoing" GameState Board

# Invalid board: X went twice
Board ← [
  "XX "
  "   "
  "   "
]
⍤⤙≍ "invalid" GameState Board

# Invalid board: O started
Board ← [
  "OOX"
  "   "
  "   "
]
⍤⤙≍ "invalid" GameState Board

# Invalid board: X won and O kept playing
Board ← [
  "XXX"
  "OOO"
  "   "
]
⍤⤙≍ "invalid" GameState Board

# Invalid board: players kept playing after a win
Board ← [
  "XXX"
  "OOO"
  "XOX"
]
⍤⤙≍ "invalid" GameState Board
