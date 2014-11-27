module DNA (hammingDistance) where

hammingDistance :: String -> String -> Int
hammingDistance x y = sum $ zipWith nucleotideDifference x y where
    nucleotideDifference m n
        | m == n = 0
        | otherwise = 1