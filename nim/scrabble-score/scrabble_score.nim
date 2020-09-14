import strutils, tables

proc invert(lettersToScore: Table[string, int]): Table[char, int] =
  for letters, score in lettersToScore:
    for letter in letters:
      result[letter] = score

const LetterToScore = {
  "AEIOULNRST": 1,
  "DG": 2,
  "BCMP": 3,
  "FHVWY": 4,
  "K": 5,
  "JX": 8,
  "QZ": 10
}.toTable().invert()

proc score(letter: char): int =
  LetterToScore[letter.toUpperAscii]

proc score*(word: string): int =
  for letter in word:
    result += letter.score
