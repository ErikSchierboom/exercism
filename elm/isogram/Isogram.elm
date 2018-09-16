module Isogram exposing (isIsogram)

import String exposing (toLower, filter, toList, toLower, length)
import Char exposing (isLower)
import Set exposing (fromList, size)


isIsogram : String -> Bool
isIsogram sentence =
    let
        letters =
            sentence
                |> toLower
                |> filter isLower

        uniqueLetters =
            letters |> toList |> fromList
    in
        length letters == size uniqueLetters
