import sequtils, strutils

proc row*(matrix: string, y: int): seq[int] =
  matrix.splitLines[y - 1].splitWhitespace.map(parseInt)

proc column*(matrix: string, x: int): seq[int] =
  for line in matrix.splitLines:
    result.add(line.splitWhitespace[x - 1].parseInt)
