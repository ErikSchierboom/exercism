def aliquot_sum (number: i32): i32 =
  if number == 1 then 0
  else
    loop acc = 0 for i in 1...(number / 2) do
      if number %% i == 0 then acc + i else acc

let classify (number: i32): []u8 = 
  assert (number > 0) 
  (
    let aliquot_sum = aliquot_sum number in
    if (aliquot_sum < number) then "Deficient" else
    if (aliquot_sum > number) then "Abundant" else
    "Perfect"
  )