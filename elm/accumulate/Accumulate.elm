module Accumulate exposing (..)


accumulate : (a -> b) -> List a -> List b
accumulate f list =
    list
        |> List.foldr (\x acc -> f x :: acc) []