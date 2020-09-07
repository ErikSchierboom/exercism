import strutils, sequtils, unicode, re

proc words(sentence: string): seq[string] =
  sentence.split(re"\s*( |-|_)\s*")

proc acronymLetter(word: string): Rune = 
  word.runeAt(0).toUpper

proc abbreviate*(sentence: string): string =
  sentence.words.map(acronymLetter).join
