module RomanNumerals exposing (toRoman)


toRoman : Int -> String
toRoman arabic =
    let
        units =
            biQuinaryDigits 1 ( "I", "V", "X" ) arabic

        tens =
            biQuinaryDigits 10 ( "X", "L", "C" ) arabic

        hundreds =
            biQuinaryDigits 100 ( "C", "D", "M" ) arabic

        thousands =
            biQuinaryDigits 1000 ( "M", "?", "?" ) arabic
    in
        thousands ++ hundreds ++ tens ++ units


biQuinaryDigits : Int -> ( String, String, String ) -> Int -> String
biQuinaryDigits place ( unit, five, ten ) arabic =
    let
        digit =
            arabic % (10 * place) // place
    in
        case digit of
            0 ->
                ""

            1 ->
                unit

            2 ->
                unit ++ unit

            3 ->
                unit ++ unit ++ unit

            4 ->
                unit ++ five

            5 ->
                five

            6 ->
                five ++ unit

            7 ->
                five ++ unit ++ unit

            8 ->
                five ++ unit ++ unit ++ unit

            9 ->
                unit ++ ten

            _ ->
                "Error"