def to_digits (number: i32): []i32 =
  let (_, digits) = loop (number, digits) = (number, []) while number > 0 do
    (number // 10, [(number %% 10)] ++ digits)
  in
    digits

def is_armstrong_number (number: i32): bool =
  let digits = to_digits number
  in
    digits 
    |> map (\d -> d ** i32.i64(length digits))
    |> i32.sum 
    |> (== number)