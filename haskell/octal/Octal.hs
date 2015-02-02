module Octal (showOct, readOct) where

import Data.Char (digitToInt)

showOct :: (Integral a, Show a) => a -> String
showOct n = showOctLoop n "" where
    showOctLoop num acc = acc `seq` case num `div` 8 of
        0 -> (show num) ++ acc
        x -> showOctLoop x $ (show (num `mod` 8) ++ acc)

readOct :: Integral a => String -> a
readOct str = str `seq` sum $ map readOctDigit $ zip (reverse str) [0..length str - 1] where
    readOctDigit (digit, index) = fromIntegral (digitToInt digit) * 8 ^ index