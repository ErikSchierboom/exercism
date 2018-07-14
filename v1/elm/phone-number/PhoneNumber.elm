module PhoneNumber exposing (..)

import Char exposing (isDigit)
import String exposing (filter, length, left, dropLeft, slice)
import Maybe exposing (map)


getNumber : String -> Maybe String
getNumber input =
    let
        digits =
            filter isDigit input

        numberOfDigits =
            length digits
    in
        if numberOfDigits == 10 then
            Just digits
        else if numberOfDigits == 11 && left 1 digits == "1" then
            Just (dropLeft 1 digits)
        else
            Nothing


prettyPrint : String -> Maybe String
prettyPrint input =
    input
        |> getNumber
        |> map (\digits -> "(" ++ slice 0 3 digits ++ ") " ++ slice 3 6 digits ++ "-" ++ slice 6 10 digits)
