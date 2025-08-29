def steps (n: i32): i32 =
  assert (n > 0)
    (let (_, steps) = loop (n, steps) = (n, 0) while n != 1 do
       (if (n %% 2 == 0) then n // 2 else n * 3 + 1, steps + 1)
     in steps)