module Pangram (isPangram) where

import Data.List (filter, nub, length)
import Data.Char (toUpper, isLetter)

letters :: String
letters = ['A' .. 'Z']

isPangram :: String -> Bool
isPangram text = all (\letter -> elem letter upperText) letters
    where
        upperText = map toUpper text
