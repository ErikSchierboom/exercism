module Say exposing (say, SayError(..))

import Dict exposing (Dict, fromList, get)
import Maybe exposing (withDefault)
import List exposing (foldr)
import String exposing (join)


type SayError
    = TooLarge
    | Negative


choose : List (Maybe a) -> List a
choose list =
    foldr
        (\x acc ->
            case x of
                Just y ->
                    y :: acc

                Nothing ->
                    acc
        )
        []
        list


say : Int -> Result SayError String
say n =
    if n < 0 then
        Err Negative
        -- else if n >= 1000000000000000 then
        --     Err TooLarge
    else if n == 0 then
        Ok "zero"
    else
        let
            ( billionsCount, millionsCount, thousandsCount, remainder ) =
                parts n
        in
            [ billions billionsCount
            , millions millionsCount
            , thousands thousandsCount
            , hundreds remainder
            ]
                |> choose
                |> join " "
                |> Ok


parts : Int -> ( Int, Int, Int, Int )
parts n =
    let
        ( billionsCount, billionsRemainder ) =
            quotRem n 1000000000

        ( millionsCount, millionsRemainder ) =
            quotRem billionsRemainder 1000000

        ( thousandsCount, thousandsRemainder ) =
            quotRem millionsRemainder 1000
    in
        ( billionsCount, millionsCount, thousandsCount, thousandsRemainder )


quotRem : Int -> Int -> ( Int, Int )
quotRem x y =
    let
        div =
            x // y

        rem =
            x % y
    in
        ( div, rem )


bases : Int -> Maybe String
bases n =
    let
        values =
            [ ( 1, "one" )
            , ( 2, "two" )
            , ( 3, "three" )
            , ( 4, "four" )
            , ( 5, "five" )
            , ( 6, "six" )
            , ( 7, "seven" )
            , ( 8, "eight" )
            , ( 9, "nine" )
            , ( 10, "ten" )
            , ( 11, "eleven" )
            , ( 12, "twelve" )
            , ( 13, "thirteen" )
            , ( 14, "fourteen" )
            , ( 15, "fifteen" )
            , ( 16, "sixteen" )
            , ( 17, "seventeen" )
            , ( 18, "eighteen" )
            , ( 19, "nineteen" )
            ]
                |> fromList
    in
        get n values


tens : Int -> Maybe String
tens n =
    if n < 20 then
        bases n
    else
        let
            values =
                [ ( 2, "twenty" )
                , ( 3, "thirty" )
                , ( 4, "forty" )
                , ( 5, "fifty" )
                , ( 6, "sixty" )
                , ( 7, "seventy" )
                , ( 8, "eighty" )
                , ( 9, "ninety" )
                ]
                    |> fromList

            ( count, remainder ) =
                quotRem n 10

            countStr =
                get count values |> withDefault ""

            basesStr =
                case bases remainder of
                    Just x ->
                        "-" ++ x

                    Nothing ->
                        ""
        in
            Just (countStr ++ basesStr)


hundreds : Int -> Maybe String
hundreds n =
    if n < 100 then
        tens n
    else
        let
            ( count, remainder ) =
                quotRem n 100

            tensStr =
                case tens remainder of
                    Just x ->
                        " " ++ x

                    Nothing ->
                        ""
        in
            case bases count of
                Just x ->
                    Just (x ++ " hundred" ++ tensStr)

                Nothing ->
                    Nothing


chunk : String -> Int -> Maybe String
chunk str n =
    case hundreds n of
        Just x ->
            Just (x ++ " " ++ str)

        Nothing ->
            Nothing


thousands : Int -> Maybe String
thousands =
    chunk "thousand"


millions : Int -> Maybe String
millions =
    chunk "million"


billions : Int -> Maybe String
billions =
    chunk "billion"
