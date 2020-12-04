module Allergies exposing (..)

import Dict exposing (Dict, fromList, get, foldr)
import Bitwise exposing (and)


allergiesBitMasks : Dict String Int
allergiesBitMasks =
    [ ( "eggs", 1 )
    , ( "peanuts", 2 )
    , ( "shellfish", 4 )
    , ( "strawberries", 8 )
    , ( "tomatoes", 16 )
    , ( "chocolate", 32 )
    , ( "pollen", 64 )
    , ( "cats", 128 )
    ]
        |> fromList


isAllergicTo : String -> Int -> Bool
isAllergicTo allergen allergies =
    case get allergen allergiesBitMasks of
        Just bitMask ->
            and allergies bitMask /= 0

        Nothing ->
            False


toList : Int -> List String
toList allergies =
    foldr
        (\allergen _ acc ->
            if isAllergicTo allergen allergies then
                allergen :: acc
            else
                acc
        )
        []
        allergiesBitMasks