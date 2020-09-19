import math, strutils

proc digits(input: string): seq[int] =
  for c in input:
    result.add(parseInt($c))

iterator slices(digits: seq[int], length: int): seq[int] =
  for i in 0 .. digits.len - length:
    yield digits[i ..< i + length]

proc largestProduct*(input: string, length: int): int =
  if length < 0 or length > input.len:
    raise newException(ValueError, "Invalid length")

  for slice in input.digits.slices(length):
    result = max(result, slice.prod)
