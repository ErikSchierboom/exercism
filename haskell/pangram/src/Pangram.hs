module Pangram (isPangram) where

import Data.List (filter, nub, length)
import Data.Char (toUpper, isLetter)

letters :: String
letters = ['A' .. 'Z']

isPangram :: String -> Bool
isPangram text =
    (length $ nub $ map toUpper $ filter isLetter text) == 26
