module Series exposing (..)

import String exposing (toList, toInt, fromChar, foldr)
import List exposing (reverse, filter, length, take)


charToDigit : Char -> Result String Int
charToDigit =
    fromChar >> toInt


toDigits : String -> Result String (List Int)
toDigits input =
    let
        folder char digits =
            case charToDigit char of
                Ok digit ->
                    Result.map (\acc -> digit :: acc) digits

                Err err ->
                    Err err
    in
        foldr folder (Ok []) input


slices : Int -> String -> Result String (List (List Int))
slices size input =
    if size < 1 then
        Err ("Invalid size: " ++ toString size)
    else
        let
            aux acc remainder =
                case remainder of
                    [] ->
                        acc
                            |> reverse
                            |> filter (length >> (==) size)

                    _ :: tl ->
                        aux (take size remainder :: acc) tl
        in
            input
                |> toDigits
                |> Result.map (aux [])
