module Pangram

let letters = set ['a'..'z']

let isPangram (sentence: string) = Set.isSubset letters (sentence.ToLower() |> set) 
