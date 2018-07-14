module Grains exposing (..)

import List exposing (sum, map)
import Maybe exposing (withDefault)


square : Int -> Maybe Float
square n =
    if n < 1 || n > 64 then
        Nothing
    else
        Just <| 2 ^ (n - 1)


total : Float
total =
    [1..64] |> map (square >> withDefault 0) |> sum
