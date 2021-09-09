module RNATranscription exposing (..)

import String exposing (foldr)
import Result exposing (map)


dnaToRna : Char -> Result Char String -> Result Char String
dnaToRna char result =
    case char of
        'G' ->
            map ((++) "C") result

        'C' ->
            map ((++) "G") result

        'T' ->
            map ((++) "A") result

        'A' ->
            map ((++) "U") result

        _ ->
            Err char


toRNA : String -> Result Char String
toRNA =
    foldr dnaToRna (Ok "")