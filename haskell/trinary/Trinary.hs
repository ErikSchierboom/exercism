module Trinary (showTri, readTri) where

showTri :: (Integral a, Show a) => a -> String
showTri n = showTriLoop n "" where
    showTriLoop num acc = acc `seq` case num `div` 3 of
        0 -> (show num) ++ acc
        x -> showTriLoop x $ (show (num `mod` 3) ++ acc)

readTri :: Integral a => String -> a
readTri str = str `seq` sum $ map readTriDigit $ zip (reverse str) [0..length str - 1] where
    readTriDigit (digit, index) = fromIntegral (fromEnum digit - fromEnum '0') * 3 ^ index