~ "flower-field.ua" ~ Annotate

# No rows
Garden ← ""
Expected  ← ""
⍤⤙≍ Expected Annotate Garden

# No columns
Garden ← [
  ""
]
Expected ← [
  ""
]
⍤⤙≍ Expected Annotate Garden

# No flowers
Garden ← [
  "   "
  "   "
  "   "
]
Expected ← [
  "   "
  "   "
  "   "
]
⍤⤙≍ Expected Annotate Garden

# Garden full of flowers
Garden ← [
  "***"
  "***"
  "***"
]
Expected ← [
  "***"
  "***"
  "***"
]
⍤⤙≍ Expected Annotate Garden

# Flower surrounded by spaces
Garden ← [
  "   "
  " * "
  "   "
]
Expected ← [
  "111"
  "1*1"
  "111"
]
⍤⤙≍ Expected Annotate Garden

# Space surrounded by flowers
Garden ← [
  "***"
  "* *"
  "***"
]
Expected ← [
  "***"
  "*8*"
  "***"
]
⍤⤙≍ Expected Annotate Garden

# Horizontal line
Garden ← [
  " * * "
]
Expected ← [
  "1*2*1"
]
⍤⤙≍ Expected Annotate Garden

# Horizontal line, flowers at edges
Garden ← [
  "*   *"
]
Expected ← [
  "*1 1*"
]
⍤⤙≍ Expected Annotate Garden

# Vertical line
Garden ← [
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
⍤⤙≍ Expected Annotate Garden

# Vertical line, flowers at edges
Garden ← [
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
⍤⤙≍ Expected Annotate Garden

# Cross
Garden ← [
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
⍤⤙≍ Expected Annotate Garden

# Large garden
Garden ← [
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
⍤⤙≍ Expected Annotate Garden
