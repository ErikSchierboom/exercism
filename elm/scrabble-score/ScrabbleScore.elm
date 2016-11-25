module ScrabbleScore exposing (..)

import String exposing (toUpper, foldl, toList)
import Dict exposing (Dict, fromList, get)
import List exposing (concatMap, map)
import Maybe exposing (withDefault)


lettersToScore : ( String, Int ) -> List ( Char, Int )
lettersToScore ( letters, score ) =
    letters
        |> toList
        |> map (\letter -> ( letter, score ))


letterScores : Dict Char Int
letterScores =
    [ ( "AEIOULNRST", 1 )
    , ( "DG", 2 )
    , ( "BCMP", 3 )
    , ( "FHVWY", 4 )
    , ( "K", 5 )
    , ( "JX", 8 )
    , ( "QZ", 10 )
    ]
        |> concatMap lettersToScore
        |> fromList


letterScore : Char -> Int
letterScore letter =
    get letter letterScores
        |> withDefault 0


scoreWord : String -> Int
scoreWord word =
    toUpper word
        |> foldl (\letter score -> score + letterScore letter) 0
