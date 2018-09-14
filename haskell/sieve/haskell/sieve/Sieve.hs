module Sieve (primesUpTo) where

primesUpTo :: Int -> [Int]
primesUpTo limit = filter (<= limit) (2 : sieve [3, 5..limit])

sieve :: [Int] -> [Int]	
sieve [] = []
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]