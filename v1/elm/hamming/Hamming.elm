module Hamming exposing (..)

import String exposing (length, toList)
import List exposing (map2, sum)


compareNucleotides : Char -> Char -> Int
compareNucleotides x y =
    if x == y then
        0
    else
        1


distance : String -> String -> Maybe Int
distance strand1 strand2 =
    if length strand1 /= length strand2 then
        Nothing
    else
        strand1
            |> toList
            |> map2 compareNucleotides (toList strand2)
            |> sum
            |> Just
