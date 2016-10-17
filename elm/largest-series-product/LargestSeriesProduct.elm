module LargestSeriesProduct exposing (largestProduct)

import String
import String exposing (isEmpty, fromChar, toInt, toList, length)
import List exposing (take, drop, reverse, foldr, product, maximum, filter)
import Maybe exposing (map, map2, withDefault)
import Result exposing (toMaybe)


chunksOf : Int -> List a -> List (List a)
chunksOf size list =
    let
        aux acc remainder =
            case remainder of
                [] ->
                    acc
                        |> filter (\x -> List.length x == size)
                        |> reverse

                hd :: tl ->
                    let
                        chunk =
                            take size remainder
                    in
                        aux (chunk :: acc) tl
    in
        aux [] list


foldMaybe : List (Maybe a) -> Maybe (List a)
foldMaybe list =
    foldr (\x acc -> map2 (\y acc' -> y :: acc') x acc) (Just []) list


toDigit : Char -> Maybe Int
toDigit char =
    char
        |> fromChar
        |> toInt
        |> toMaybe


toDigits : String -> Maybe (List Int)
toDigits input =
    input
        |> toList
        |> List.map toDigit
        |> foldMaybe


products : Int -> List Int -> List Int
products span digits =
    digits
        |> chunksOf span
        |> List.map product


largestProduct : Int -> String -> Maybe Int
largestProduct span input =
    if
        span
            < 0
            || (span > 0 && isEmpty input)
            || (span > length input)
    then
        Nothing
    else
        input
            |> toDigits
            |> map (products span >> maximum >> withDefault 1)
