module Etl exposing (transform)

import String exposing (toLower)
import List exposing (map, concatMap)
import Dict exposing (Dict, toList, fromList)


transformLetter : Int -> String -> ( String, Int )
transformLetter i letter =
    ( toLower letter, i )


transformLetters : ( Int, List String ) -> List ( String, Int )
transformLetters ( i, letters ) =
    letters
        |> map (transformLetter i)


transform : Dict Int (List String) -> Dict String Int
transform input =
    input
        |> toList
        |> concatMap transformLetters
        |> fromList
