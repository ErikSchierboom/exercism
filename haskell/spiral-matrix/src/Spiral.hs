module Spiral (spiral) where

value :: Int -> Int -> Int -> Int -> Int
value size startValue row col 
    | row == 0 = startValue + col
    | col == size - 1 = startValue + size + row - 1
    | row == size - 1 = startValue + size * 3 - 3 - col
    | col == 0 = startValue + size * 4 - 4 - row
    | otherwise = value (size - 2) (startValue + size * 4 - 4) (row - 1) (col -1)

spiral :: Int -> [[Int]]
spiral size = [ [ value size 1 row col | col <- [0.. size - 1] ] | row <- [0.. size - 1] ]