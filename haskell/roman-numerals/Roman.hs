module Roman (numerals) where

numerals :: Int -> String
numerals number = numerals' number "" numeralThresholds where
    numerals' _ acc [] = acc
    numerals' remainder acc thresholds@((threshold, numeral):xs) 
        | threshold <= remainder = numerals' (remainder - threshold) (acc ++ numeral) thresholds
        | otherwise = numerals' remainder acc xs

numeralThresholds :: [(Int, String)]
numeralThresholds = [(1000, "M"),
                     (900,  "CM"),
                     (500,  "D"),
                     (400,  "CD"),
                     (100,  "C"),
                     (90,   "XC"),
                     (50,   "L"),
                     (40,   "XL"),
                     (10,   "X"),
                     (9,    "IX"),
                     (5,    "V"),
                     (4,    "IV"),
                     (1,    "I")]