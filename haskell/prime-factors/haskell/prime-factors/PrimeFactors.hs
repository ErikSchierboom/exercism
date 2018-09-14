module PrimeFactors (primeFactors) where

primeFactors :: Int -> [Int]
primeFactors number = primeFactorsLoop number possiblePrimes

primeFactorsLoop :: Int -> [Int] -> [Int]
primeFactorsLoop remainder possibleFactors
	| remainder <= 1 = []
	| remainder `mod` factor == 0 = factor : primeFactorsLoop (remainder `div` factor) possibleFactors
	| otherwise = primeFactorsLoop remainder (tail possibleFactors)
    where factor = head possibleFactors

possiblePrimes :: [Int]
possiblePrimes = 2 : 3 : [n + k | n <- [6, 12 ..], k <- [-1, 1]]