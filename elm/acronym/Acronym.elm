module Acronym exposing (abbreviate)

import List exposing (map, concatMap)
import String exposing (split, left, toUpper, join)


wordToLetter : String -> String
wordToLetter word =
    word
        |> left 1
        |> toUpper


words : String -> List String
words phrase =
    phrase
        |> split " "
        |> concatMap (split "-")


abbreviate : String -> String
abbreviate phrase =
    phrase
        |> words
        |> map wordToLetter
        |> join ""
