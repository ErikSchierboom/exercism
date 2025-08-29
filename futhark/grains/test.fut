import "grains"

-- Grains on square 1
-- ==
-- entry: test_square
-- input { 1 }
-- output { 1u64 }

-- Grains on square 2
-- ==
-- entry: test_square
-- input { 2 }
-- output { 2u64 }

-- Grains on square 3
-- ==
-- entry: test_square
-- input { 3 }
-- output { 4u64 }

-- Grains on square 4
-- ==
-- entry: test_square
-- input { 4 }
-- output { 8u64 }

-- Grains on square 16
-- ==
-- entry: test_square
-- input { 16 }
-- output { 32768u64 }

-- Grains on square 32
-- ==
-- entry: test_square
-- input { 32 }
-- output { 2147483648u64 }

-- Grains on square 64
-- ==
-- entry: test_square
-- input { 64 }
-- output { 9223372036854775808u64 }

-- Square 0 is invalid
-- ==
-- entry: test_square
-- input { 0 }
-- error: Error*

-- Negative square is invalid
-- ==
-- entry: test_square
-- input { -1 }
-- error: Error*

-- Square greater than 64 is invalid
-- ==
-- entry: test_square
-- input { 65 }
-- error: Error*

-- Returns the total number of grains on the board
-- ==
-- entry: test_total
-- input { 42 }
-- output { 18446744073709551615u64 }

entry test_square (n: i32): u64 =
  square n

entry test_total (_n: i32): u64 =
  total ()
