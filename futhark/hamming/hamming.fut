def distance [n] (strand1: [n]u8) (strand2: [n]u8): i32 = 
  map2 (\a b -> if a == b then 0 else 1) strand1 strand2 |> i32.sum
