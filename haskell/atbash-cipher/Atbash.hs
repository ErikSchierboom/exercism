module Atbash (encode) where

import Data.Char (toLower, ord, chr, isAlphaNum, isDigit)
import Data.List (intercalate)
import Data.List.Split (chunksOf)
import Data.Map (Map, fromList, (!))

encode :: String -> String
encode = encodeInChunks . map encodeLetter . filterInput

encodeInChunks :: String -> String
encodeInChunks = intercalate " " . chunksOf 5

filterInput :: String -> String
filterInput = filter isAlphaNum

encodeLetter :: Char -> Char
encodeLetter letter = lettersMap ! (toLower letter)

lettersMap :: Map Char Char
lettersMap = fromList $ map mapLetter $ ['a'..'z'] ++ ['0'..'9']

mapLetter :: Char -> (Char, Char)
mapLetter letter
    | isDigit letter = (letter, letter)
    | otherwise = (letter, chr(ord('z') - ord(letter) + ord('a')))