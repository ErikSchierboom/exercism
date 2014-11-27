module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear year = isDivisibleBy 4 && (isDivisibleBy 400 || not (isDivisibleBy 100))
    where isDivisibleBy x = year `mod` x == 0