import algorithm, sequtils, strutils

const lowerCaseAlphabet = toSeq('a'..'z')
const upperCaseAlphabet = toSeq('A'..'Z')

proc rotate*(text: string, shift: int): string =
  let rotateLowerCase = lowerCaseAlphabet.rotatedLeft(shift)
  let rotateUpperCase = upperCaseAlphabet.rotatedLeft(shift)
  
  for letter in text:
    if letter.isUpperAscii:
      result.add(rotateUpperCase[upperCaseAlphabet.find(letter)])
    elif letter.isLowerAscii:
      result.add(rotateLowerCase[lowerCaseAlphabet.find(letter)])
    else:
      result.add(letter)
