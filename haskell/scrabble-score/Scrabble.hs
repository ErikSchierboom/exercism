module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

scoreLetter :: Char -> Int
scoreLetter letter 
    | elem upperLetter "AEIOULNRST" = 1
    | elem upperLetter "DG"         = 2
    | elem upperLetter "BCMP"       = 3
    | elem upperLetter "FHVWY"      = 4
    | elem upperLetter "K"          = 5
    | elem upperLetter "JX"         = 9
    | elem upperLetter "QZ"         = 10
    | otherwise                     = 0
    where 
        upperLetter = toUpper letter

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter