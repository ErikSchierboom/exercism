module Scrabble (scoreLetter, scoreWord) where

import Data.Function (on)
import Data.List (sortBy)
import Data.Char (toUpper, isLetter)
import Data.Array (Array, listArray, (!))

scoreLetter :: Char -> Int
scoreLetter letter 
	| isLetter letter = letterScores ! toUpper letter
	| otherwise       = 0

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter

letterScores :: Array Char Int
letterScores = listArray ('A', 'Z') sortedLetterScoresList where	
	lettersScores = [("AEIOULNRST", 1),  ("DG", 2), ("BCMP", 3), ("FHVWY", 4), ("K", 5), ("JX", 9), ("QZ", 10)]
	letterScoreTuples = concatMap (\(word, score) -> map (\letter -> (letter, score)) word) lettersScores
	sortedLetterScoresList = map snd $ sortBy (compare `on` fst) letterScoreTuples