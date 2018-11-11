module ArmstrongNumbers (armstrong) where

import Data.Char (digitToInt)

armstrong :: Integral a => a -> Bool
armstrong number = sumOfDigitsToPower == toInteger number
    where
        digits = map digitToInt . show $ toInteger number
        numberOfDigits = length digits
        digitToPower digit = digit ^ numberOfDigits
        sumOfDigitsToPower = toInteger . sum $ map digitToPower digits