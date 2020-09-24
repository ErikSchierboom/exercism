proc row(n: int): seq[int] =
  result.add(1)

  var column = 1

  for j in 1 ..< n:
    column = column * (n - j) div j
    result.add(column)

proc pascal*(n: int): seq[seq[int]] =
  for i in 1..n:
    result.add(row(i))
