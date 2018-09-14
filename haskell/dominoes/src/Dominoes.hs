module Dominoes (chain) where

import Data.List (concatMap, find)
import Data.Tuple (swap)

rotate :: [a] -> Int -> [a]
rotate [] _ = []
rotate xs n = zipWith const (drop n (cycle xs)) xs

rotations :: [a] -> [[a]]
rotations xs = map (rotate xs) [1 .. length xs]

allPaths :: [(Int, Int)] -> [[(Int, Int)]] 
allPaths [] = []
allPaths [x] = [[x], [swap x]]
allPaths (x:xs) = concatMap (\path -> rotations (x:path) ++ rotations (swap x:path)) $ allPaths xs

validPath :: [(Int, Int)] -> Bool
validPath [] = True
validPath [(x, y)] = x == y
validPath ((x, y):(x', y'):xs) = y == x' && validPath ((x, y'):xs)

chain :: [(Int, Int)] -> Maybe [(Int, Int)]
chain [] = Just []
chain dominoes = find validPath $ allPaths dominoes