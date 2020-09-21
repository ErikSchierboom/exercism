import parseutils, strutils

proc encode*(plainText: string): string =
  var i = 0

  while i < plainText.len:
    let letter = plainText[i]
    let count = skipWhile(plainText, { letter }, i)
    i.inc count

    result.add(if count == 1: $letter else: $count & letter)

proc decode*(cipherText: string): string =
  var i = 0

  while i < cipherText.len:
    var count = 1
    i.inc parseInt(cipherText, count, i)
    
    result.add(cipherText[i].repeat(count))
    i.inc
