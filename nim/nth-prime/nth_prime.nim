import math, sequtils

proc isPrime(n: int): bool =
  let r = n.toFloat.sqrt.floor.toInt
  (5 .. r).allIt(n mod it != 0)

iterator primes: int =
  yield 2
  yield 3

  for r in countup(6, int.high, 6):
    if isPrime(r - 1):
      yield r - 1
    
    if isPrime(r + 1):
      yield r + 1

proc prime*(n: int): int =
  if n < 1:
    raise newException(ValueError, "Cannot use zero or negative number")
  
  var nth = 0

  for prime in primes():
    nth.inc

    if nth == n:
      return prime
