import algorithm, sequtils, strutils, std/wordwrap

const groupSize = 5
const letters = toSeq('a'..'z')
const digits = toSeq('0'..'9')
const plain = letters & digits
const cipher = letters.reversed & digits

proc chunked(phrase: string): string =
  phrase.wrapWords(groupSize, newLine = " ")

proc encode(letter: char): char =
  cipher[plain.find(letter)]

proc encode*(phrase: string): string =
  phrase.toLowerAscii.filter(isAlphaNumeric).map(encode).join.chunked

proc decode(letter: char): char =
  plain[cipher.find(letter)]

proc decode*(phrase: string): string =
  phrase.replace(" ").map(decode).join