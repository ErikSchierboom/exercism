module Pangram

let isPangram (input: string) =
    Set.isSubset (set ['a'..'z']) (input.ToLowerInvariant() |> set) 
 