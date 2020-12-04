module WordCount exposing (..)

import String exposing (toLower, isEmpty)
import Regex exposing (regex, split, HowMany(..))
import List exposing (foldl, filter)
import Dict exposing (Dict, empty, get, update)


updateWordCount : Maybe Int -> Maybe Int
updateWordCount value =
    case value of
        Just x ->
            Just (x + 1)

        Nothing ->
            Just 1


updateCount : String -> Dict String Int -> Dict String Int
updateCount word dict =
    update word updateWordCount dict


words : String -> List String
words input =
    input
        |> toLower
        |> split All (regex "[^a-z0-9]+")
        |> filter (isEmpty >> not)


wordCount : String -> Dict String Int
wordCount input =
    input
        |> words
        |> foldl updateCount empty