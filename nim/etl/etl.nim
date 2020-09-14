import strutils, tables

proc transform*(input: Table[int, seq[char]]): Table[char, int] =
  for key, chars in input:
    for c in chars:
      result[c.toLowerAscii] = key
