module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (permutations)
import Data.Set (fromList, member, delete)

anagramsFor :: String -> [String] -> [String]
anagramsFor x ys = filter isAnagram ys where
    toLower' = map toLower
    lowerInput = toLower' x
    anagrams = delete lowerInput $ fromList $ permutations lowerInput
    isAnagram word = member (toLower' word) anagrams