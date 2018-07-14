module Grains (square, total) where

import Data.Bits (shift)

square :: Int -> Integer
square x = 1 `shift` (x - 1)

total :: Integer
total = square 65 - 1