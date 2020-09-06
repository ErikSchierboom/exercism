import math

proc onSquare*(square: int): uint64 =
  if square < 1 or square > 64:
    raise newException(ValueError, "Invalid square")
  else:
    2'u64 ^ uint64(square - 1)

proc total*: uint64 = 
  2'u64 ^ 64 - 1
