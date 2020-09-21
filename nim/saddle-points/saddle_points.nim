import tables

proc saddlePoints*(matrix: seq[seq[int]]): seq[(int, int)] =
  var rowMax = initTable[int, int]()
  var colMin = initTable[int, int]()

  for y, row in matrix:
    rowMax[y] = row.max

    for x, col in row:
      colMin[x] = col.min(colMin.getOrDefault(x, col))

  for y, row in matrix:
    for x, col in row:
      if matrix[y][x] >= rowMax[y] and matrix[y][x] <= colMin[x]:
        result.add((y + 1, x + 1))
