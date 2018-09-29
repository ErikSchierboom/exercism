module Isogram (isIsogram) where

import Data.List (length, map, filter, nub)
import Data.Char (isLower, toLower)

isIsogram :: String -> Bool
isIsogram sentence = length letters == length uniqueLetters
    where
        letters = filter isLower $ map toLower sentence 
        uniqueLetters = nub letters  