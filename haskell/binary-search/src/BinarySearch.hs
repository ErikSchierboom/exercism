module BinarySearch (find) where

import Data.Array

find :: Ord a => Array Int a -> a -> Maybe Int
find array x = findBetweenIndices array x 0 (length array - 1)

findBetweenIndices :: Ord a => Array Int a -> a -> Int -> Int-> Maybe Int
findBetweenIndices array x left right
    | left > right = Nothing
    | middle_value < x = findBetweenIndices array x (middle_index + 1) right
    | middle_value > x = findBetweenIndices array x left (middle_index - 1)
    | otherwise = Just middle_index
    where
        middle_index = (left + right) `quot` 2
        middle_value = array ! middle_index
