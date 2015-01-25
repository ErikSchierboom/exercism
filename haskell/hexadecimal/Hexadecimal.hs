module Hexadecimal (hexToInt) where

import Data.Char (isHexDigit, digitToInt)

hexToInt :: String -> Int
hexToInt = hexToIntLoop 0

hexToIntLoop :: Int -> String -> Int
hexToIntLoop acc [] = acc `seq` acc
hexToIntLoop acc (x:xs) = acc `seq` case isHexDigit x of
    True  -> hexToIntLoop (acc * 16 + digitToInt x) xs
    False -> 0