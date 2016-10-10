module Raindrops exposing (..)

import List
import String


raindrops : Int -> String
raindrops x =
    let
        factorsMapping =
            [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]

        factors =
            factorsMapping
                |> List.filter (\( factor, _ ) -> x % factor == 0)
                |> List.map snd
                |> String.concat
    in
        case factors of
            "" ->
                toString x

            _ ->
                factors
