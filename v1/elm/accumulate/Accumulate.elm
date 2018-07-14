module Accumulate exposing (..)

import List exposing (foldr)


accumulate : (a -> b) -> List a -> List b
accumulate f list =
    list
        |> foldr (\x acc -> f x :: acc) []
