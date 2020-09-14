import strutils, tables

proc transform*(scores: Table[int, seq[char]]): Table[char, int] =
  for score, letters in scores:
    for letter in letters:
      result[letter.toLowerAscii] = score
