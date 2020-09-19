import intsets

proc primes*(max: int): seq[int] =
  var multiples = initIntSet()

  for i in 2 .. max:
    if multiples.contains(i):
      continue
    
    result.add(i)

    for j in countup(i, max, i):
      multiples.incl(j)
