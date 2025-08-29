import "largest_series_product"

-- Finds the largest product if span equals length
-- ==
-- input { "29" 2 }
-- output { 18 }

-- Can find the largest product of 2 with numbers in order
-- ==
-- input { "0123456789" 2 }
-- output { 72 }

-- Can find the largest product of 2
-- ==
-- input { "576802143" 2 }
-- output { 48 }

-- Can find the largest product of 3 with numbers in order
-- ==
-- input { "0123456789" 3 }
-- output { 504 }

-- Can find the largest product of 3
-- ==
-- input { "1027839564" 3 }
-- output { 270 }

-- Can find the largest product of 5 with numbers in order
-- ==
-- input { "0123456789" 5 }
-- output { 15120 }

-- Can get the largest product of a big number
-- ==
-- input { "73167176531330624919225119674426574742355349194934" 6 }
-- output { 23520 }

-- Reports zero if the only digits are zero
-- ==
-- input { "0000" 2 }
-- output { 0 }

-- Reports zero if all spans include zero
-- ==
-- input { "99099" 3 }
-- output { 0 }

-- Rejects span longer than string length
-- ==
-- input { "123" 4 }
-- error: Error*

-- Rejects empty string and nonzero span
-- ==
-- input { "" 1 }
-- error: Error*

-- Rejects invalid character in digits
-- ==
-- input { "1234a5" 2 }
-- error: Error*

-- Rejects negative span
-- ==
-- input { "12345" -1 }
-- error: Error*

let main (digits: []u8) (span: i32) : i32 =
  largest_product digits span
