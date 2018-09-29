module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)


classify :: Int -> Maybe Classification
classify number
    | number <= 0 = Nothing
    | sumOfFactors == number = Just Perfect
    | sumOfFactors < number = Just Deficient
    | otherwise = Just Abundant
    where sumOfFactors = sum [x | x <- [1 .. number `div` 2], number `mod` x == 0]
