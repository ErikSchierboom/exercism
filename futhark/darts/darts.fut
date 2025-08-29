def score (x: f64) (y: f64): i32 =
  let distance = f64.hypot x y in
  if distance <= 1.0 then 10
  else if distance <= 5.0 then 5
  else if distance <= 10.0 then 1
  else 0
