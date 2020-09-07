const Rows = {0..7}
const Cols = {0..7}

type Position = tuple[row: int, col: int]

proc validateQueen(queen: Position): void =
  if not Rows.contains(queen.row):
    raise newException(ValueError, "Invalid row for queen")
  if not Cols.contains(queen.col):
    raise newException(ValueError, "Invalid col for queen")

proc validateQueens(queen1: Position, queen2: Position): void =
  validateQueen(queen1)
  validateQueen(queen2)

  if queen1 == queen2:
    raise newException(ValueError, "Queens cannot have same position")

proc canAttack*(queen1: Position, queen2: Position): bool =
  validateQueens(queen1, queen2)

  queen1.row == queen2.row or
  queen1.col == queen2.col or
  abs(queen1.row - queen2.row) == abs(queen1.col - queen2.col)

proc boardCell(position: Position, queen1: Position, queen2: Position): char =
  if position == queen1:
    'W'
  elif position == queen2:
    'B'
  else:
    '_'

proc boardRow(row: int, queen1: Position, queen2: Position): string =
  for col in Cols:
    result.add(boardCell((row, col), queen1, queen2))

proc board*(queen1: Position, queen2: Position): array[Rows.len, string] =
  validateQueens(queen1, queen2)

  for row in Rows:
    result[row] = boardRow(row, queen1, queen2)