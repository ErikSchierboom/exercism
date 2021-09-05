module Anagram exposing (..)

import String exposing (toLower, toList, fromList)
import List exposing (sort, map, filter)


normalize : String -> String
normalize str =
    str
        |> toLower
        |> toList
        |> sort
        |> fromList


detect : String -> List String -> List String
detect target inputs =
    let
        normalizedTarget =
            normalize target
    in
        inputs
            |> filter (\input -> normalize input == normalizedTarget && toLower input /= toLower target)