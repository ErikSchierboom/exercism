module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper)
import Data.List (map, concatMap, filter)
import Data.List.Split (splitOn)

wordToLetters :: String -> String
wordToLetters [] = []
wordToLetters (x:xs) = if all isUpper xs then [toUpper x] else toUpper x:filter isUpper xs

phraseToWords :: String -> [String]
phraseToWords phrase = concatMap (splitOn "-") $ words phrase

abbreviate :: String -> String
abbreviate phrase = concatMap wordToLetters $ phraseToWords phrase
