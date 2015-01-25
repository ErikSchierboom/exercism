module Luhn (checkDigit, addends, checksum, isValid, create) where

checkDigit :: Integral a => a -> a
checkDigit = flip mod 10

addends :: Integral a => a -> [a]
addends num = reverse $ map addend $ zipWithIndex $ digits num

addend :: Integral a => (a, Int) -> a
addend (digit, index) 
    | index `mod` 2 == 0 = digit
    | digit >= 5 = digit * 2 - 9
    | otherwise = digit * 2

checksum :: Integral a => a -> a
checksum num = sum (addends num) `mod` 10

isValid :: Integral a => a -> Bool
isValid = (0 ==) . checksum

create :: Integral a => a -> a
create num 
    | isValid targetNum = targetNum
    | otherwise = targetNum + (10 - (checksum targetNum `mod` 10)) where
        targetNum = num * 10

digits :: Integral a => a -> [a]
digits 0 = []
digits num = num `mod` 10 : digits (num `div` 10)

zipWithIndex :: [a] -> [(a, Int)]
zipWithIndex xs = zip xs [0..length xs - 1]