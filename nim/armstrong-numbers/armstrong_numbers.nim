import sequtils
import math

proc toDigit(c: char): int =
  c.ord - '0'.ord

proc toDigits(number: int): seq[int] =
  toSeq($number).map(toDigit)

proc armstrongSum(number: int): int =
  let digits = toDigits(number)
  digits.foldl(a + (b ^ digits.len), 0)

proc isArmstrongNumber*(number: int): bool =
  armstrong_sum(number) == number
