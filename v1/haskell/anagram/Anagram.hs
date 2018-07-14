module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor input = filter (\word -> normalize input == normalize word && toLowerStr word /= toLowerStr input)

toLowerStr :: String -> String
toLowerStr = map toLower

normalize :: String -> String
normalize = sort . toLowerStr