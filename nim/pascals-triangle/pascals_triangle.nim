import std/math

func row*(i: int): seq[int] =
  for j in 1..i:
    result.add(fac(i-1) div (fac(j-1) * fac(i-j)))

func pascal*(n: int): seq[seq[int]] =
  for i in 1..n:
    result.add(row(i))
