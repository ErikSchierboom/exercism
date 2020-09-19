import strutils

proc invalidCharacters(number: string): bool =
  not number.allCharsInSet(Digits + Whitespace)

proc digits(number: string): seq[int] =
  for c in number:
    if isDigit(c):
      result.add(parseInt($c))

proc toDouble(digit: int): int =
  if digit > 4:
    digit * 2 - 9
  else: 
    digit * 2

proc doubledSum(digits: seq[int]): int =
  proc indexForDouble(i: int): bool = (digits.len - i) mod 2 == 0

  for i in countdown(digits.len - 1, 0):
    if i.indexForDouble:
      result.inc(digits[i].toDouble)
    else:
      result.inc(digits[i])

proc isValid*(number: string): bool =
  if number.invalidCharacters:
    return false

  let digits = number.digits
  if digits == [0]:
    return false

  digits.doubledSum mod 10 == 0
