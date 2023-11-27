type nucleotide = A | C | G | T

let hamming_distance first second =
  if List.is_empty first && not (List.is_empty second) then
    Error "left strand must not be empty"
  else if List.is_empty second && not (List.is_empty first) then
    Error "right strand must not be empty"
  else if List.length first <> List.length second then
    Error "left and right strands must be of equal length"
  else
    Ok (List.fold_left2 (fun distance l r -> if l <> r then distance + 1 else distance) 0 first second)
