module AtbashCipher exposing (..)

import String exposing (toLower, fromChar, join, foldl, length, left, dropLeft, filter)
import Char exposing (isLower, isDigit, toCode, fromCode)
import List exposing (reverse)


chunksOf : Int -> String -> List String
chunksOf size input =
    let
        aux acc remainder =
            let
                chunk =
                    left size remainder

                chunkSize =
                    length chunk
            in
                if chunkSize == 0 then
                    reverse acc
                else
                    aux (chunk :: acc) (dropLeft size remainder)
    in
        aux [] input


transpose : Char -> String
transpose char =
    if isDigit char then
        fromChar char
    else if isLower char then
        toCode 'z'
            + toCode 'a'
            - toCode char
            |> fromCode
            |> fromChar
    else
        ""


encode : String -> String
encode input =
    input
        |> toLower
        |> foldl (\char acc -> acc ++ transpose char) ""
        |> chunksOf 5
        |> join " "


decode : String -> String
decode input =
    input
        |> encode
        |> filter (\char -> char /= ' ')
