import "eliuds_eggs"

-- 0 eggs
-- ==
-- input { 0 }
-- output { 0 }

-- 1 egg
-- ==
-- input { 16 }
-- output { 1 }

-- 4 eggs
-- ==
-- input { 89 }
-- output { 4 }

-- 13 eggs
-- ==
-- input { 2000000000 }
-- output { 13 }

let main (encoded_value: i32): i32 =
  egg_count encoded_value
  