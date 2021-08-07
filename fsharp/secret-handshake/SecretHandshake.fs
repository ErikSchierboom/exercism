module SecretHandshake

let private operations =
    [fun acc -> acc @ ["wink"]
     fun acc -> acc @ ["double blink"]
     fun acc -> acc @ ["close your eyes"]
     fun acc -> acc @ ["jump"]
     List.rev]

let commands number =
  operations
  |> List.indexed
  |> List.fold (fun acc (shiftLeft, operation) -> 
      if number &&& (1 <<< shiftLeft) <> 0 then operation acc else acc) []