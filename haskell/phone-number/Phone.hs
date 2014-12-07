module Phone (areaCode, number, prettyPrint) where

import Data.Char (isDigit)

number :: String -> String
number x 
    | length digits == 11 && head digits == '1' = tail digits
    | length digits == 10 = digits
    | otherwise = "0000000000" where 
        digits = filter isDigit x

areaCode :: String -> String
areaCode x = take 3 $ number x

prettyPrint :: String -> String
prettyPrint x = "(" ++ (areaCode x) ++ ") " ++ firstPart ++ "-" ++ secondPart where
    firstPart = take 3 $ drop 3 $ number x
    secondPart = take 4 $ drop 6 $ number x 