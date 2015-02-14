module Triangle (row, triangle) where

triangle :: Integral a => [[a]]
triangle = iterate (extendWith (+)) [1]

row :: Integral a => a -> [a]
row n = triangle !! fromIntegral (n - 1)

zipMap :: (a -> a -> a) -> [a] -> [a] -> [a]
zipMap _ xs [] = xs
zipMap _ [] ys = ys
zipMap f (x:xs) (y:ys) = f x y : zipMap f xs ys

extendWith :: (a -> a -> a) -> [a] -> [a]
extendWith _ [] = []
extendWith f xs@(x:ys) = x : zipMap f xs ys