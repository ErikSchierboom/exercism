import math, sequtils, strutils

proc normalized(plainText: string): string =
  plainText.toLowerAscii().filterIt(it.isAlphaNumeric).join

proc dimensions(normalized: string): (int, int) =
  let cols = normalized.len.toFloat.sqrt.ceil.toInt
  let rows = (normalized.len.toFloat / cols.toFloat).ceil.toInt
  (rows, cols)

proc chunked(normalized: string): string =
  let (rows, cols) = normalized.dimensions
  let padded = normalized.alignLeft(rows * cols)

  for col in 0 ..< cols:
    for row in 0 ..< rows:
      result.add(padded[row * cols + col])

    if col < cols - 1:
      result.add(' ')

proc encrypt*(plainText: string): string =
  plainText.normalized.chunked
