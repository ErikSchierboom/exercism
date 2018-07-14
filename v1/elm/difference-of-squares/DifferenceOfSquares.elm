module DifferenceOfSquares exposing (..)

import List exposing (sum, map)


square : Int -> Int
square x =
    x * x


squareOfSum : Int -> Int
squareOfSum x =
    [1..x] |> sum |> square


sumOfSquares : Int -> Int
sumOfSquares x =
    [1..x] |> map square |> sum


difference : Int -> Int
difference x =
    squareOfSum x - sumOfSquares x
