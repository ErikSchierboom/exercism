import strutils, sequtils, re

proc words(sentence: string): seq[string] =
  sentence.split(re"\s*( |-|_)\s*")

proc acronymLetter(word: string): char = 
  word[0].toUpperAscii

proc abbreviate*(sentence: string): string =
  sentence.words.map(acronymLetter).join
