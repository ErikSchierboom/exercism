module TwelveDays exposing (recite)


toNumber : Int -> String
toNumber n =
    case n of
        0 ->
            "a"

        1 ->
            "and a"

        2 ->
            "two"

        3 ->
            "three"

        4 ->
            "four"

        5 ->
            "five"

        6 ->
            "six"

        7 ->
            "seven"

        8 ->
            "eight"

        9 ->
            "nine"

        10 ->
            "ten"

        11 ->
            "eleven"

        12 ->
            "twelve"

        _ ->
            "unknown number"


toCount : Int -> String
toCount count =
    case count of
        1 ->
            "first"

        2 ->
            "second"

        3 ->
            "third"

        4 ->
            "fourth"

        5 ->
            "fifth"

        6 ->
            "sixth"

        7 ->
            "seventh"

        8 ->
            "eighth"

        9 ->
            "ninth"

        10 ->
            "tenth"

        11 ->
            "eleventh"

        12 ->
            "twelfth"

        _ ->
            "unknown count"


toSubject : Int -> String
toSubject n =
    case n of
        0 ->
            "Partridge in a Pear Tree"

        1 ->
            "Partridge in a Pear Tree"

        2 ->
            "Turtle Doves"

        3 ->
            "French Hens"

        4 ->
            "Calling Birds"

        5 ->
            "Gold Rings"

        6 ->
            "Geese-a-Laying"

        7 ->
            "Swans-a-Swimming"

        8 ->
            "Maids-a-Milking"

        9 ->
            "Ladies Dancing"

        10 ->
            "Lords-a-Leaping"

        11 ->
            "Pipers Piping"

        12 ->
            "Drummers Drumming"

        _ ->
            "unknown subject"


toVerseSubject : Int -> String
toVerseSubject n =
    toNumber n ++ " " ++ toSubject n


verseBegin : Int -> String
verseBegin n =
    "On the " ++ toCount n ++ " day of Christmas my true love gave to me, "


verseEnd : Int -> String
verseEnd n =
    case n of
        1 ->
            toVerseSubject 0

        _ ->
            List.range 1 n
                |> List.reverse
                |> List.map toVerseSubject
                |> String.join ", "


verse : Int -> String
verse n =
    verseBegin n ++ verseEnd n ++ "."


recite : Int -> Int -> List String
recite start stop =
    List.range start stop
        |> List.map verse
