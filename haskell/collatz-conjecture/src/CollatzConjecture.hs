module CollatzConjecture (collatz) where

import Data.List (genericLength)

next :: Integer -> Integer
next n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1 = Nothing
  | otherwise = Just . genericLength . takeWhile (/=1) $ iterate next n