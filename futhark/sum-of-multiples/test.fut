import "sum_of_multiples"

-- No multiples within limit
-- ==
-- input { [3, 5] 1 }
-- output { 0 }

-- One factor has multiples within limit
-- ==
-- input { [3, 5] 4 }
-- output { 3 }

-- More than one multiple within limit
-- ==
-- input { [3] 7 }
-- output { 9 }

-- More than one factor with multiples within limit
-- ==
-- input { [3, 5] 10 }
-- output { 23 }

-- Each multiple is only counted once
-- ==
-- input { [3, 5] 100 }
-- output { 2318 }

-- A much larger limit
-- ==
-- input { [3, 5] 1000 }
-- output { 233168 }

-- Three factors
-- ==
-- input { [7, 13, 17] 20 }
-- output { 51 }

-- Factors not relatively prime
-- ==
-- input { [4, 6] 15 }
-- output { 30 }

-- Some pairs of factors relatively prime and some not
-- ==
-- input { [5, 6, 8] 150 }
-- output { 4419 }

-- One factor is a multiple of another
-- ==
-- input { [5, 25] 51 }
-- output { 275 }

-- Much larger factors
-- ==
-- input { [43, 47] 10000 }
-- output { 2203160 }

-- All numbers are multiples of 1
-- ==
-- input { [1] 100 }
-- output { 4950 }

-- No factors means an empty sum
-- ==
-- input { empty([0]i32) 10000 }
-- output { 0 }

-- The only multiple of 0 is 0
-- ==
-- input { [0] 1 }
-- output { 0 }

-- The factor 0 does not affect the sum of multiples of other factors
-- ==
-- input { [3, 0] 4 }
-- output { 3 }

-- Solutions using include-exclude must extend to cardinality greater than 3
-- ==
-- input { [2, 3, 5, 7, 11] 10000 }
-- output { 39614537 }

let main (numbers: []i32) (upper_bound: i32): i32 =
  sum_of_multiples numbers upper_bound
