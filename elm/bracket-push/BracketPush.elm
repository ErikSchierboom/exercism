module BracketPush exposing (isPaired)


isOpeningBracket : Char -> Bool
isOpeningBracket character =
    character == '(' || character == '[' || character == '{'


openingBracketForClosingBracket : Char -> Maybe Char
openingBracketForClosingBracket character =
    case character of
        ')' ->
            Just '('

        ']' ->
            Just '['

        '}' ->
            Just '{'

        _ ->
            Nothing


isPairedHelper : List Char -> List Char -> Bool
isPairedHelper input openedBrackets =
    case input of
        [] ->
            List.isEmpty openedBrackets

        x :: xs ->
            if isOpeningBracket x then
                isPairedHelper xs (x :: openedBrackets)

            else
                case openingBracketForClosingBracket x of
                    Just openingBracket ->
                        if List.head openedBrackets == Just openingBracket then
                            isPairedHelper xs (List.drop 1 openedBrackets)

                        else
                            False

                    Nothing ->
                        isPairedHelper xs openedBrackets


isPaired : String -> Bool
isPaired input =
    isPairedHelper (String.toList input) []
