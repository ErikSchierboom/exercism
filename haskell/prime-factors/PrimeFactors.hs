module PrimeFactors (primeFactors) where

primeFactors :: Int -> [Int]
primeFactors number = primeFactors' number 2 []

primeFactors' :: Int -> Int -> [Int] -> [Int]
primeFactors' remainder factor factors 
	| remainder <= 1 = []
	| remainder `mod` factor == 0 = factor : primeFactors' (remainder `div` factor) factor factors
	| otherwise = primeFactors' remainder (factor + 1) factors