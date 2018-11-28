module Proverb(recite) where

pairs :: [a] -> [(a, a)]
pairs [] = []
pairs xs = zip xs (tail xs)

forWantOfLine :: (String, String) -> String
forWantOfLine (input1, input2) = "For want of a " ++ input1 ++ " the " ++ input2 ++ " was lost."

allForTheWant :: String -> String
allForTheWant input = "And all for the want of a " ++ input ++ "."

recite :: [String] -> String
recite [] = ""
recite inputs = forWantOfLines ++ allForTheWantLine
    where
        forWantOfLines = unlines . map forWantOfLine $ pairs inputs
        allForTheWantLine = allForTheWant $ head inputs
