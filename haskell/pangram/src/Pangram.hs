module Pangram (isPangram) where

import Data.Char (toUpper)

letters :: String
letters = ['A' .. 'Z']

isPangram :: String -> Bool
isPangram text = all (`elem` map toUpper text) letters