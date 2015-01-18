module PrimeFactors (primeFactors) where

primeFactors :: Int -> [Int]
primeFactors number = primeFactors' number primeFactors'' []

primeFactors' :: Int -> [Int] -> [Int] -> [Int]
primeFactors' remainder possibleFactors factorsFound
	| remainder <= 1 = []
	| remainder `mod` factor == 0 = factor : primeFactors' (remainder `div` factor) possibleFactors factorsFound
	| otherwise = primeFactors' remainder (tail possibleFactors) factorsFound
    where factor = head possibleFactors

primeFactors'' :: [Int]
primeFactors'' = 2 : 3 : [n + k | n <- [6, 12 ..], k <- [-1, 1]]