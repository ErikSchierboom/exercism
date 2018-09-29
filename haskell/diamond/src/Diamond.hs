module Diamond (diamond) where

import Data.List.Index (indexed)

makeLine :: Int -> (Int, Char) -> String
makeLine letterCount (row, letter) = 
    if letter == 'A' then outerSpaces ++ letter:outerSpaces
    else outerSpaces ++ letter:innerSpaces ++ letter:outerSpaces
    where
        outerSpaces = replicate (letterCount - row - 1) ' '
        innerSpaces = replicate (if row == 0 then 0 else row * 2 - 1) ' '

diamond :: Char -> Maybe [String]
diamond letter = Just diamondLetters
    where
        letters = indexed ['A' .. letter]
        allLetters = letters ++ (tail $ reverse letters)
        diamondLetters = map (makeLine $ length letters) allLetters
