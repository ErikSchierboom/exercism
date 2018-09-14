module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper, isAsciiUpper)
import Data.Array (Array, array, (!))

scoreLetter :: Char -> Int
scoreLetter letter 
	| isAsciiUpper upperLetter = letterScores ! upperLetter
	| otherwise = 0
	where upperLetter = toUpper letter

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter

letterScores :: Array Char Int
letterScores = array ('A', 'Z') letterScoreTuples where	
	lettersScores = [("AEIOULNRST", 1),  ("DG", 2), ("BCMP", 3), ("FHVWY", 4), ("K", 5), ("JX", 9), ("QZ", 10)]
	letterScoreTuples = concatMap (\(word, score) -> map (\letter -> (letter, score)) word) lettersScores