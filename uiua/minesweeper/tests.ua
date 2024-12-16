~ "minesweeper.ua" ~ Annotate

# No rows
Minefield ← ""
Expected  ← ""
⍤⤙≍ Expected Annotate Minefield

# No columns
Minefield ← [
  ""
]
Expected ← [
  ""
]
⍤⤙≍ Expected Annotate Minefield

# No mines
Minefield ← [
  "   "
  "   "
  "   "
]
Expected ← [
  "   "
  "   "
  "   "
]
⍤⤙≍ Expected Annotate Minefield

# Minefield with only mines
Minefield ← [
  "***"
  "***"
  "***"
]
Expected ← [
  "***"
  "***"
  "***"
]
⍤⤙≍ Expected Annotate Minefield

# Mine surrounded by spaces
Minefield ← [
  "   "
  " * "
  "   "
]
Expected ← [
  "111"
  "1*1"
  "111"
]
⍤⤙≍ Expected Annotate Minefield

# Space surrounded by mines
Minefield ← [
  "***"
  "* *"
  "***"
]
Expected ← [
  "***"
  "*8*"
  "***"
]
⍤⤙≍ Expected Annotate Minefield

# Horizontal line
Minefield ← [
  " * * "
]
Expected ← [
  "1*2*1"
]
⍤⤙≍ Expected Annotate Minefield

# Horizontal line, mines at edges
Minefield ← [
  "*   *"
]
Expected ← [
  "*1 1*"
]
⍤⤙≍ Expected Annotate Minefield

# Vertical line
Minefield ← [
  " "
  "*"
  " "
  "*"
  " "
]
Expected ← [
  "1"
  "*"
  "2"
  "*"
  "1"
]
⍤⤙≍ Expected Annotate Minefield

# Vertical line, mines at edges
Minefield ← [
  "*"
  " "
  " "
  " "
  "*"
]
Expected ← [
  "*"
  "1"
  " "
  "1"
  "*"
]
⍤⤙≍ Expected Annotate Minefield

# Cross
Minefield ← [
  "  *  "
  "  *  "
  "*****"
  "  *  "
  "  *  "
]
Expected ← [
  " 2*2 "
  "25*52"
  "*****"
  "25*52"
  " 2*2 "
]
⍤⤙≍ Expected Annotate Minefield

# Large minefield
Minefield ← [
  " *  * "
  "  *   "
  "    * "
  "   * *"
  " *  * "
  "      "
]
Expected ← [
  "1*22*1"
  "12*322"
  " 123*2"
  "112*4*"
  "1*22*2"
  "111111"
]
⍤⤙≍ Expected Annotate Minefield
