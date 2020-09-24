import math, sequtils

proc toDigit(c: char): int =
  c.ord - '0'.ord

proc toDigits(number: int): seq[int] =
  toSeq($number).map(toDigit)

proc armstrongSum(number: int): int =
  let digits = toDigits(number)
  digits.mapIt(it ^ digits.len).sum

proc isArmstrongNumber*(number: int): bool =
  number == number.armstrongSum
