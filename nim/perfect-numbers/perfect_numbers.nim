import algorithm

type
  Classification* = enum
    Perfect, Abundant, Deficient

iterator factors(n: int): int =
  for i in 1 .. n div 2:
    if n mod i == 0:
      yield i

proc aliquotSum(n: int): int =
  for factor in n.factors:
    result.inc factor

proc classify*(n: int): Classification =
  if n < 1:
    raise newException(ValueError, "Number not positive")

  let sum = n.aliquotSum

  if sum > n:
    Abundant
  elif sum < n:
    Deficient
  else:
    Perfect
