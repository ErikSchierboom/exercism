module Pangram exposing (..)

import String exposing (all, toLower, contains, fromChar)


isPangram : String -> Bool
isPangram str =
    let
        loweredStr =
            str |> toLower
    in
        "abcdefghijklmnopqrstuvwxyz"
            |> all (\c -> contains (fromChar c) loweredStr)
