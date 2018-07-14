module Prime (nth) where

nth :: Int -> Int
nth n = primes !! (n - 1)

isPrime :: Int -> Bool
isPrime n = not $ any (\x -> n `mod` x == 0) [5..r] where
    r = floor $ (sqrt :: Double -> Double) $ fromIntegral n

primes :: [Int]
primes = 2 : 3 : filter isPrime possiblePrimes

possiblePrimes :: [Int]
possiblePrimes = [n + k | n <- [6, 12 ..], k <- [-1, 1]]