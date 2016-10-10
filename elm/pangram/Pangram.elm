module Pangram exposing (..)

import String


isPangram : String -> Bool
isPangram str =
    let
        loweredStr =
            str |> String.toLower
    in
        "abcdefghijklmnopqrstuvwxyz"
            |> String.all (\c -> String.contains (String.fromChar c) loweredStr)
