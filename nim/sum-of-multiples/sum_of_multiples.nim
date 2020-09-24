import sequtils

proc sum*(number: int, multiples: seq[int]): int =
  proc isMultiple(n: int): bool = multiples.anyIt(it != 0 and n mod it == 0)

  for n in 1..<number:
    if isMultiple(n):
      result.inc(n)
