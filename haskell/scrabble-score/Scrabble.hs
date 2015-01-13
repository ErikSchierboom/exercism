module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)
import Data.Map (Map, fromList, findWithDefault)

scoreLetter :: Char -> Int
scoreLetter letter = findWithDefault 0 (toUpper letter) letterScores

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter

letterScores :: Map Char Int
letterScores = fromList letterScoresList where	
	lettersScoresList = [("AEIOULNRST", 1),  ("DG", 2), ("BCMP", 3), ("FHVWY", 4), ("K", 5), ("JX", 9), ("QZ", 10)]
	letterScoresList = concatMap (\(word, score) -> map (\letter -> (letter, score)) word) lettersScoresList