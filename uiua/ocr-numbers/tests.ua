~ "ocr-numbers.ua" ~ Convert

# Recognizes 0
Display ← [
  " _ "
  "| |"
  "|_|"
  "   "
]
⍤⤙≍ "0" Convert Display

# Recognizes 1
Display ← [
  "   "
  "  |"
  "  |"
  "   "
]
⍤⤙≍ "1" Convert Display

# Unreadable but correctly sized displays return ?
Display ← [
  "   "
  "  _"
  "  |"
  "   "
]
⍤⤙≍ "?" Convert Display

# Display with a number of lines that is not a multiple of four raises an error
Display ← [
  " _ "
  "| |"
  "   "
]
⍤⤙≍ "Number of input lines is not a multiple of four" ⍣(Convert Display)

# Display with a number of columns that is not a multiple of three raises an error
Display ← [
  "    "
  "   |"
  "   |"
  "    "
]
⍤⤙≍ "Number of input columns is not a multiple of three" ⍣(Convert Display)

# Recognizes 110101100
Display ← [
  "       _     _        _  _ "
  "  |  || |  || |  |  || || |"
  "  |  ||_|  ||_|  |  ||_||_|"
  "                           "
]
⍤⤙≍ "110101100" Convert Display

# Garbled numbers in a string are replaced with ?
Display ← [
  "       _     _           _ "
  "  |  || |  || |     || || |"
  "  |  | _|  ||_|  |  ||_||_|"
  "                           "
]
⍤⤙≍ "11?10?1?0" Convert Display

# Recognizes 2
Display ← [
  " _ "
  " _|"
  "|_ "
  "   "
]
⍤⤙≍ "2" Convert Display

# Recognizes 3
Display ← [
  " _ "
  " _|"
  " _|"
  "   "
]
⍤⤙≍ "3" Convert Display

# Recognizes 4
Display ← [
  "   "
  "|_|"
  "  |"
  "   "
]
⍤⤙≍ "4" Convert Display

# Recognizes 5
Display ← [
  " _ "
  "|_ "
  " _|"
  "   "
]
⍤⤙≍ "5" Convert Display

# Recognizes 6
Display ← [
  " _ "
  "|_ "
  "|_|"
  "   "
]
⍤⤙≍ "6" Convert Display

# Recognizes 7
Display ← [
  " _ "
  "  |"
  "  |"
  "   "
]
⍤⤙≍ "7" Convert Display

# Recognizes 8
Display ← [
  " _ "
  "|_|"
  "|_|"
  "   "
]
⍤⤙≍ "8" Convert Display

# Recognizes 9
Display ← [
  " _ "
  "|_|"
  " _|"
  "   "
]
⍤⤙≍ "9" Convert Display

# Recognizes string of decimal numbers
Display ← [
  "    _  _     _  _  _  _  _  _ "
  "  | _| _||_||_ |_   ||_||_|| |"
  "  ||_  _|  | _||_|  ||_| _||_|"
  "                              "
]
⍤⤙≍ "1234567890" Convert Display

# Numbers separated by empty lines are recognized. Lines are joined by commas.
Display ← [
  "    _  _ "
  "  | _| _|"
  "  ||_  _|"
  "         "
  "    _  _ "
  "|_||_ |_ "
  "  | _||_|"
  "         "
  " _  _  _ "
  "  ||_||_|"
  "  ||_| _|"
  "         "
]
⍤⤙≍ "123,456,789" Convert Display
