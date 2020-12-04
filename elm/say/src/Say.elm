module Say exposing (say, SayError(..))

import Array exposing (Array, fromList, get)
import Maybe exposing (withDefault)


type SayError
    = TooLarge
    | Negative


firstTwenty : Array String
firstTwenty =
    fromList
        [ "zero"
        , "one"
        , "two"
        , "three"
        , "four"
        , "five"
        , "six"
        , "seven"
        , "eight"
        , "nine"
        , "ten"
        , "eleven"
        , "twelve"
        , "thirteen"
        , "fourteen"
        , "fifteen"
        , "sixteen"
        , "seventeen"
        , "eighteen"
        , "nineteen"
        ]


tens : Array String
tens =
    fromList
        [ "zero"
        , "ten"
        , "twenty"
        , "thirty"
        , "forty"
        , "fifty"
        , "sixty"
        , "seventy"
        , "eighty"
        , "ninety"
        ]


safeGet : Int -> Array String -> String
safeGet index array =
    get index array |> withDefault ""


upToTwenty : Int -> String
upToTwenty n =
    safeGet n firstTwenty


upToOneHundred : Int -> String
upToOneHundred n =
    let
        ( divisor, remainder ) =
            quotRem n 10
    in
        if n < 10 then
            upToTwenty remainder
        else if remainder == 0 then
            safeGet divisor tens
        else
            safeGet divisor tens ++ "-" ++ upToTwenty remainder


upToOneThousand : Int -> String
upToOneThousand n =
    let
        ( divisor, remainder ) =
            quotRem n 100
    in
        if n < 100 then
            "and " ++ upToOneHundred n
        else if remainder == 0 then
            upToTwenty divisor ++ " hundred"
        else
            upToTwenty divisor ++ " hundred and " ++ upToOneHundred remainder


upToOneMillion : Int -> String
upToOneMillion n =
    let
        ( divisor, remainder ) =
            quotRem n 1000
    in
        if n < 1000 then
            upToOneThousand n
        else if remainder == 0 then
            upToTwenty divisor ++ " thousand"
        else
            upToTwenty divisor ++ " thousand " ++ upToOneThousand remainder


upToOneBillion : Int -> String
upToOneBillion n =
    let
        ( divisor, remainder ) =
            quotRem n 1000000
    in
        if remainder == 0 then
            upToTwenty divisor ++ " million"
        else
            upToTwenty divisor ++ " million " ++ upToOneMillion remainder


upToOneTrillion : Int -> String
upToOneTrillion n =
    let
        ( divisor, remainder ) =
            quotRem n 1000000000
    in
        if remainder == 0 then
            upToTwenty divisor ++ " billion"
        else
            upToTwenty divisor ++ " billion " ++ upToOneBillion remainder


say : Int -> Result SayError String
say n =
    if n < 0 then
        Err Negative
    else if n == 0 then
        Ok "zero"
    else if n < 20 then
        Ok (upToTwenty n)
    else if n < 100 then
        Ok (upToOneHundred n)
    else if n < 1000 then
        Ok (upToOneThousand n)
    else if n < 1000000 then
        Ok (upToOneMillion n)
    else if n < 1000000000 then
        Ok (upToOneBillion n)
    else if n < 1000000000000 then
        Ok (upToOneTrillion n)
    else
        Err TooLarge


quotRem : Int -> Int -> ( Int, Int )
quotRem x y =
    let
        div =
            x // y

        rem =
            x % y
    in
        ( div, rem )