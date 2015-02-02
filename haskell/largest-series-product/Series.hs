module Series (digits, slices, largestProduct) where

import Data.Char (digitToInt)
import Data.List (tails)

digits :: String -> [Int]
digits = map digitToInt

slices :: Int -> String -> [[Int]]
slices size = map (take size) . filter ((>= size) . length) . tails . digits

largestProduct :: Int -> String -> Int
largestProduct = (largestProductLoop .) . slices

largestProductLoop :: [[Int]] -> Int
largestProductLoop [] = 1
largestProductLoop xs = maximum $ map product xs