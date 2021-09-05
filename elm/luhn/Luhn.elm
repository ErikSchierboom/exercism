module Luhn exposing (valid)

import Char exposing (isDigit)


toInt : Char -> Int
toInt char =
    Char.toCode char - Char.toCode '0'


toDigits : String -> List Int
toDigits input =
    input
        |> String.filter isDigit
        |> String.toList
        |> List.map toInt


normalizeDigit : Int -> Int -> Int
normalizeDigit index digit =
    if index % 2 == 0 then
        digit

    else if digit < 5 then
        digit * 2

    else
        digit * 2 - 9


invalidInput : String -> List Int -> Bool
invalidInput input digits =
    let
        validCharacter character =
            isDigit character || character == ' '
    in
    List.length digits <= 1 || not (String.all validCharacter input)


checksum : List Int -> Int
checksum digits =
    digits
        |> List.reverse
        |> List.indexedMap normalizeDigit
        |> List.sum


valid : String -> Bool
valid input =
    let
        digits =
            toDigits input
    in
    if invalidInput input digits then
        False

    else
        checksum digits % 10 == 0
