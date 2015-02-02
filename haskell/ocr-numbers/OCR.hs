module OCR (convert) where

import Data.Map (Map, fromList, findWithDefault)
import Data.List (transpose, intercalate)
import Data.List.Split (chunksOf)

convert :: String -> String
convert input = intercalate "," $ map rowToDigits characters where
    rows = chunksOf characterHeight $ lines input
    rowToCharacters = transpose . map (chunksOf characterWidth)
    characters = map rowToCharacters rows
    rowToDigits = map matchCharacter

characterWidth :: Int
characterWidth = 3

characterHeight :: Int
characterHeight = 4

matchCharacter :: [String] -> Char
matchCharacter input = findWithDefault '?' input digitPatterns

digitPatterns :: Map [String] Char
digitPatterns = fromList [
    ([ " _ "
     , "| |"
     , "|_|"
     , "   " ], '0'),
    ([ "   "
     , "  |"
     , "  |"
     , "   " ], '1'),
    ([ " _ "
     , " _|"
     , "|_ "
     , "   " ], '2'),
    ([ " _ "
     , " _|"
     , " _|"
     , "   " ], '3'),
    ([ "   "
     , "|_|"
     , "  |"
     , "   " ], '4'),
    ([ " _ "
     , "|_ "
     , " _|"
     , "   " ], '5'),
    ([ " _ "
     , "|_ "
     , "|_|"
     , "   "], '6'),
    ([ " _ "
     , "  |"
     , "  |"
     , "   " ], '7'),
    ([ " _ "
     , "|_|"
     , "|_|"
     , "   " ], '8'),
    ([ " _ "
     , "|_|"
     , " _|"
     , "   "], '9')]