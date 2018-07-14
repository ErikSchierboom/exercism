module Squares (sumOfSquares, squareOfSums, difference) where

sumOfSquares :: Integral a => a -> a
sumOfSquares num = sum $ map square [1..num]

squareOfSums :: Integral a => a -> a
squareOfSums num = square $ sum [1..num]

difference :: Integral a => a -> a
difference num = squareOfSums num - sumOfSquares num

square :: Integral a => a -> a
square num = num * num