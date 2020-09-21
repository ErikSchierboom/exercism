proc primeFactors*(n: int64): seq[int] = 
  var factor = 2
  var remainder = n

  while remainder > 1:
    while remainder mod factor != 0:
      factor.inc(if factor == 2: 1 else: 2)

    remainder = remainder div factor
    result.add(factor)
