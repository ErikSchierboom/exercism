import strutils, sequtils

proc words(sentence: string): seq[string] =
  sentence.replace("_").replace("-", " ").split().filterIt(not it.isEmptyOrWhitespace)

proc acronymLetter(word: string): char = 
  word[0].toUpperAscii

proc abbreviate*(sentence: string): string =
  sentence.words.map(acronymLetter).join
