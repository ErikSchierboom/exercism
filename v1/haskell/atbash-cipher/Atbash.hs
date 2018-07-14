module Atbash (encode) where

import Prelude hiding (lookup)
import Data.Char (toLower, ord, chr, isDigit)
import Data.List.Split (chunksOf)
import Data.Maybe (mapMaybe)
import Data.Map (Map, fromList, lookup)

encode :: String -> String
encode = encodeInChunks . mapMaybe encodeLetter

encodeInChunks :: String -> String
encodeInChunks = unwords . chunksOf 5

encodeLetter :: Char -> Maybe Char
encodeLetter letter = lookup (toLower letter) lettersMap

lettersMap :: Map Char Char
lettersMap = fromList $ map mapLetter $ ['a'..'z'] ++ ['0'..'9']

mapLetter :: Char -> (Char, Char)
mapLetter letter
    | isDigit letter = (letter, letter)
    | otherwise = (letter, chr(ord 'z' - ord letter  + ord 'a'))