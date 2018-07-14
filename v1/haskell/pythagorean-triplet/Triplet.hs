module Triplet (mkTriplet, isPythagorean, pythagoreanTriplets) where

import Data.List (sort)

data Triplet = Triplet { x :: Int, y :: Int, z :: Int }
    deriving (Show, Eq)

mkTriplet :: Int -> Int -> Int -> Triplet
mkTriplet a b c  = Triplet a' b' c' where
    [a', b', c'] = sort [a, b, c]

isPythagorean :: Triplet -> Bool
isPythagorean triplet = square (x triplet) + square (y triplet) == square (z triplet)

pythagoreanTriplets :: Int -> Int -> [Triplet]
pythagoreanTriplets a b = [mkTriplet x' y' z' | x' <- [a  .. b - 2]
                                              , y' <- [x' .. b - 1]
                                              , let target = square x' + square y'
                                              , let z' = squareRoot target
                                              , z' <= b
                                              , square z' == target]

square :: Int -> Int
square n = n * n

squareRoot :: Int -> Int
squareRoot = floor . (sqrt :: Double -> Double) . fromIntegral