module IsbnVerifier (isbn) where

import Data.List (reverse)
import Data.Char (isDigit, digitToInt)

isValid :: String -> Int -> Int -> Bool
isValid remainder checksum index = 
    case remainder of
        [] -> 
            if index == 11 then checksum `mod` 11 == 0 else False
        '-':xs -> 
            isValid xs checksum index
        'X':xs -> 
            if index == 1 then isValid xs 10 (index + 1) else False
        x:xs ->
            if isDigit x then isValid xs (checksum + (digitToInt x * index)) (index + 1) else False

isbn :: String -> Bool
isbn input = isValid (reverse input) 0 1
