module Change (findFewestCoins) where

import Prelude hiding (lookup)
import Data.List (sortOn, uncons, map, length)
import Data.Map.Strict (Map, empty, insertWith, insert, lookup, fromList, (!))

minimalCoins :: [Integer] -> Map Integer [Integer] -> Integer -> Maybe [Integer]
minimalCoins coins coinsToChangeMap target =
    fst <$> uncons (sortedChange coins)
    where
        sortedChange = sortOn length . map (\x -> x : coinsToChangeMap ! (target - x)) . filter (<= target)

updateMinimalCoinsMap :: [Integer] -> Map Integer [Integer] -> Integer ->  Map Integer [Integer]
updateMinimalCoinsMap coins coinsToChangeMap target = 
    case minimalCoins coins coinsToChangeMap target of
        Just x -> insert target x coinsToChangeMap
        Nothing ->  coinsToChangeMap

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins = 
    lookup target changes
    where
        changes = foldl (updateMinimalCoinsMap coins) (fromList [(0, [])]) [1..target]