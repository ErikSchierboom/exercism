let to_digit (digit: u8): u8 = assert (digit >= '0' && digit <= '9') (digit - '0')

let largest_product [n] (digits: [n]u8) (span: i32) : i32 = 
  let span = i64.i32 span in assert (span >= 0 && span <= n)
  (
    let digits = digits |> map to_digit |> map i32.u8
    in
      (0...n-span)
      |> map (\i -> i32.product digits[i:i+span])
      |> i32.maximum
  )
