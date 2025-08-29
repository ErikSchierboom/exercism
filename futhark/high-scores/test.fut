import "high_scores"

-- List of scores
-- ==
-- entry: test_scores
-- input { [30, 50, 20, 70] }
-- output { [30, 50, 20, 70] }

-- Latest score
-- ==
-- entry: test_latest
-- input { [100, 0, 90, 30] }
-- output { 30 }

-- Personal best
-- ==
-- entry: test_personal_best
-- input { [40, 100, 70] }
-- output { 100 }

-- Personal top three from a list of scores
-- ==
-- entry: test_personal_top_three
-- input { [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70] }
-- output { [100, 90, 70] }

-- Personal top highest to lowest
-- ==
-- entry: test_personal_top_three
-- input { [20, 10, 30] }
-- output { [30, 20, 10] }

-- Personal top when there is a tie
-- ==
-- entry: test_personal_top_three
-- input { [40, 20, 40, 30] }
-- output { [40, 40, 30] }

entry test_scores [n] (values: [n]i32): [n]i32 =
  scores values

entry test_latest (values: []i32): i32 =
  latest values

entry test_personal_best (values: []i32): i32 =
  personal_best values

entry test_personal_top_three (values: []i32): [3]i32 =
  personal_top_three values
