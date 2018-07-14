module RunLengthEncoding exposing (..)

import String exposing (fromChar, repeat, concat, toList, foldl, foldr)
import Char exposing (toCode, isDigit)
import Maybe exposing (withDefault, map)


digitToInt : Char -> Int
digitToInt c =
    toCode c - toCode '0'


encodePartition : Maybe ( Char, Int ) -> String
encodePartition partition =
    case partition of
        Nothing ->
            ""

        Just ( char, 1 ) ->
            fromChar char

        Just ( char, count ) ->
            toString count ++ fromChar char


encodeFolder : Maybe ( Char, Int ) -> String -> List Char -> String
encodeFolder current encoded remainder =
    case remainder of
        [] ->
            encoded ++ encodePartition current

        hd :: tl ->
            case current of
                Nothing ->
                    encodeFolder (Just ( hd, 1 )) encoded tl

                Just ( char, count ) ->
                    if hd == char then
                        encodeFolder (Just ( char, count + 1 )) encoded tl
                    else
                        encodeFolder (Just ( hd, 1 )) (encoded ++ encodePartition current) tl


encode : String -> String
encode input =
    encodeFolder Nothing "" (toList input)


foldMaybe : (a -> b -> b) -> b -> Maybe a -> b
foldMaybe f s x =
    case x of
        Nothing ->
            s

        Just y ->
            f y s


stringOfLength : Int -> Char -> String
stringOfLength count char =
    fromChar char |> repeat count


decodeFolder : Char -> ( String, Maybe Int ) -> ( String, Maybe Int )
decodeFolder char ( decoded, count ) =
    if isDigit char then
        let
            updatedCount =
                count
                    |> foldMaybe (\x acc -> acc + x * 10) (digitToInt char)
                    |> Just
        in
            ( decoded, updatedCount )
    else
        let
            updateDecoded =
                count
                    |> foldMaybe (\x acc -> acc ++ stringOfLength (x - 1) char) (decoded ++ fromChar char)
        in
            ( updateDecoded, Nothing )


decode : String -> String
decode input =
    input
        |> foldl decodeFolder ( "", Nothing )
        |> fst


version : Int
version =
    2
