module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples divisors n = sum multiples where
	multiples = [x | x <- [1..n-1], isMultiple x]
	isMultiple x = any (\y -> x `mod` y == 0) divisors

sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault n = sumOfMultiples [3, 5] n