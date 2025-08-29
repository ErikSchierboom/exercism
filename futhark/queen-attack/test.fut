import "queen_attack"

-- Queen with a valid position
-- ==
-- entry: test_create
-- input { 2 2 }
-- auto output

-- Queen must have positive row
-- ==
-- entry: test_create
-- input { -2 2 }
-- error: Error*

-- Queen must have row on board
-- ==
-- entry: test_create
-- input { 8 4 }
-- error: Error*

-- Queen must have positive column
-- ==
-- entry: test_create
-- input { 2 -2 }
-- error: Error*

-- Queen must have column on board
-- ==
-- entry: test_create
-- input { 4 8 }
-- error: Error*

-- Cannot attack
-- ==
-- entry: test_can_attack
-- input { 2 4 6 6 }
-- output { false }

-- Can attack on same row
-- ==
-- entry: test_can_attack
-- input { 2 4 2 6 }
-- output { true }

-- Can attack on same column
-- ==
-- entry: test_can_attack
-- input { 4 5 2 5 }
-- output { true }

-- Can attack on first diagonal
-- ==
-- entry: test_can_attack
-- input { 2 2 0 4 }
-- output { true }

-- Can attack on second diagonal
-- ==
-- entry: test_can_attack
-- input { 2 2 3 1 }
-- output { true }

-- Can attack on third diagonal
-- ==
-- entry: test_can_attack
-- input { 2 2 1 1 }
-- output { true }

-- Can attack on fourth diagonal
-- ==
-- entry: test_can_attack
-- input { 1 7 0 6 }
-- output { true }

-- Cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal
-- ==
-- entry: test_can_attack
-- input { 4 1 2 5 }
-- output { false }

entry test_create (row: i32) (column: i32): bool =
  let queen = create row column
  in queen.row == row && queen.column == column

entry test_can_attack (white_queen_row: i32) (white_queen_column: i32) (black_queen_row: i32) (black_queen_column: i32): bool =
  let white_queen = create white_queen_row white_queen_column
  let black_queen = create black_queen_row black_queen_column
  in can_attack white_queen black_queen
