let sum_of_multiples (numbers: []i32) (upper_bound: i32): i32 =
  (0...(upper_bound - 1))
  |> filter (\i -> any (\j -> j != 0 && i %% j == 0) numbers)
  |> i32.sum
