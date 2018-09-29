module Brackets (arePaired) where

isOpeningBracket :: Char -> Bool
isOpeningBracket character = elem character "([{"

openingBracketForClosingBracket :: Char -> Maybe Char
openingBracketForClosingBracket character =
    case character of
        ')' -> Just '('
        ']' -> Just '['
        '}' -> Just '{'
        _ -> Nothing

arePairedHelper :: String -> String -> Bool
arePairedHelper [] openedBrackets = null openedBrackets
arePairedHelper (x:xs) openedBrackets
    | isOpeningBracket x = arePairedHelper xs (x:openedBrackets)
    | otherwise =
        case openingBracketForClosingBracket x of
            Just expectedOpeningBracket ->
                if null openedBrackets || head openedBrackets /= expectedOpeningBracket then
                    False
                else
                    arePairedHelper xs (tail openedBrackets)
            Nothing ->
                arePairedHelper xs openedBrackets

arePaired :: String -> Bool
arePaired input = arePairedHelper input []
