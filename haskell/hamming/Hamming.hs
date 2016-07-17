module Hamming (distance) where

distance :: String -> String -> Int
distance a b = length . filter (uncurry (/=)) $ zip a b