module Roman (numerals) where

import Data.List (find)

numerals :: Int -> String
numerals number = numerals' number "" where
    numerals' remainder acc = 
        case find ((<= remainder) . fst) numeralThresholds of
            Just (threshold, numeral) -> numerals' (remainder - threshold) (acc ++ numeral)
            Nothing -> acc

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