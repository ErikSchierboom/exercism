module Raindrops exposing (..)

import List exposing (filter, map)
import String exposing (concat)


raindrops : Int -> String
raindrops x =
    let
        factorsMapping =
            [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]

        factors =
            factorsMapping
                |> filter (\( factor, _ ) -> x % factor == 0)
                |> map snd
                |> concat
    in
        case factors of
            "" ->
                toString x

            _ ->
                factors
