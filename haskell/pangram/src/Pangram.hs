module Pangram (isPangram) where

import Data.Char (toUpper)
import Data.Set (Set, fromList, delete)

letters :: Set Char
letters = fromList ['A' .. 'Z']

isPangram' :: String -> Set Char -> Bool
isPangram' text lettersNotFound
    | null lettersNotFound = True
    | null text = False
    | otherwise = isPangram' (tail text) (delete (head text) lettersNotFound)

isPangram :: String -> Bool
isPangram text = isPangram' (map toUpper text) letters