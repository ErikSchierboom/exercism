module CollatzConjecture (collatz) where

collatz' :: Integer -> Integer -> Maybe Integer
collatz' steps number
    | number < 1 = Nothing
    | number == 1 = Just steps
    | number `mod` 2 == 0 = collatz' (steps + 1) (number `div` 2)
    | otherwise = collatz' (steps + 1) (number * 3 + 1)

collatz :: Integer -> Maybe Integer
collatz = collatz' 0