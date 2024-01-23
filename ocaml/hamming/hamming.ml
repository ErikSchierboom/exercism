type nucleotide = A | C | G | T

let hamming_distance left right =
  match List.length left, List.length right with
  | x, y when x = y -> Ok (List.fold_left2 (fun distance l r -> if l <> r then distance + 1 else distance) 0 left right)
  | 0, _ -> Error "left strand must not be empty"
  | _, 0 -> Error "right strand must not be empty"
  | _ -> Error "left and right strands must be of equal length"
