module Series (slices) where

import Data.Char (digitToInt)

slices :: Int -> String -> [[Int]]
slices len list = filter ((len ==) . length) digitSlices where
	digitSlices = slicesLoop [] len digits
	digits = map digitToInt list

slicesLoop :: [[Int]] -> Int -> [Int] -> [[Int]]
slicesLoop _ 0 _ = []
slicesLoop acc _ [] = reverse acc
slicesLoop acc len list@(_:xs) = slicesLoop (take len list:acc) len xs