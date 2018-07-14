module SumOfMultiples exposing (..)

import List exposing (any, filter, sum)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples numbers upperBound =
    let
        isMultiple x =
            numbers |> any (\y -> x % y == 0)
    in
        [1..upperBound - 1]
            |> filter isMultiple
            |> sum
