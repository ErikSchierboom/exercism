proc steps*(n: int): int =
  if n < 1:
    raise newException(ValueError, "Invalid number of steps")
  
  var current = n
  var count = 0

  while current != 1:
    if current mod 2 == 0:
      current = current div 2
    else:
      current = current * 3 + 1

    count.inc

  count
