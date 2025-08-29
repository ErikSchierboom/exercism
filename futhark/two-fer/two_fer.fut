def two_fer (name: []u8): []u8 =
  let name = if null name then "you" else name
  in "One for " ++ name ++ ", one for me."
