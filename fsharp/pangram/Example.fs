module Pangram

let alphabet = set ['a'..'z']

let isPangram (input: string) =  
    input.ToLowerInvariant()
    |> set
    |> Set.isSubset alphabet