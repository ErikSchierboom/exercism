module CollatzConjecture (collatz) where

import Data.List (genericLength)

collatz :: Integer -> Maybe Integer
collatz number 
    | number < 1 = Nothing
    | otherwise = Just . genericLength . takeWhile (/=1) $ iterate next number
        where
            next x = if even x then x `div` 2 else 3 * x + 1