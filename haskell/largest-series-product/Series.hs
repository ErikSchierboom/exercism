module Series (digits, slices, largestProduct) where

import Data.Char (digitToInt)

digits :: String -> [Int]
digits = map digitToInt

slices :: Int -> String -> [[Int]]
slices size input = map (\i -> take size $ drop i digits') [0 .. length input - size] where
    digits' = digits input

largestProduct :: Int -> String -> Int
largestProduct _ [] = 1
largestProduct size input = maximum . map product $ slices size input