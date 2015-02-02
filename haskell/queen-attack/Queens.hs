module Queens (boardString, canAttack) where

import Data.List (intersperse)

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString whiteQueen blackQueen = concatMap row [0..7] where
    row y = intersperse ' ' (map (\x -> col $ Just (y, x)) [0..7]) ++ "\n"
    col position
        | position == whiteQueen = 'W'
        | position == blackQueen = 'B'
        | otherwise = '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (row1, col1) (row2, col2) = canAttackHorizontally || canAttackVertically || canAttackDiagonally where
    canAttackHorizontally = row1 == row2
    canAttackVertically = col1 == col2
    canAttackDiagonally = abs (row1 - row2) == abs (col1 - col2)