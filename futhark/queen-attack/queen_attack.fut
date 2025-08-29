type Queen = { row: i32, column: i32 }

let create (row: i32) (column: i32): Queen =
  assert (row >= 0 && row <= 7 && column >= 0 && column <= 7) { row, column }

let can_attack (white_queen: Queen) (black_queen: Queen): bool =
  white_queen.row == black_queen.row ||
  white_queen.column == black_queen.column ||
  i32.abs (white_queen.row - black_queen.row) == i32.abs (white_queen.column - black_queen.column)
