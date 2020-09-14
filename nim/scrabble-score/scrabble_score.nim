import strutils

proc score(letter: char): int =
  case letter.toUpperAscii
  of 'D', 'G': 2
  of 'B', 'C', 'M', 'P': 3
  of 'F', 'H', 'V', 'W', 'Y': 4
  of 'K': 5
  of 'J', 'X': 8
  of 'Q', 'Z': 10
  else: 1

proc score*(word: string): int =
  for letter in word:
    result += letter.score
