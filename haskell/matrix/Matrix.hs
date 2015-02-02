module Matrix ( Matrix, row, column, rows, cols, shape, transpose
              , reshape, flatten, fromString, fromList) where

import qualified Data.Vector as V

data Matrix a = Matrix { cells :: V.Vector a,
                         rows :: Int,
                         cols :: Int } 
 deriving (Show, Eq)

row :: Int -> Matrix a -> V.Vector a
row y matrix = V.slice (y * cols') cols' cells' where
    cells' = cells matrix
    cols' = cols matrix

column :: Int -> Matrix a -> V.Vector a
column x matrix = V.backpermute cells' columnIndices where
    cells' = cells matrix
    cols' = cols matrix
    rows' = rows matrix
    columnIndices = V.generate rows' (\y -> (y * cols') + x)

shape :: Matrix a -> (Int, Int)
shape matrix = (rows matrix, cols matrix)

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (rows', cols') matrix = Matrix { cells = cells matrix, rows = rows', cols = cols' }

fromString :: Read a => String -> Matrix a
fromString str = fromList $ map rowToCols rows' where
    rows' = lines str
    rowToCols row' = case reads row' of
        [] -> []
        (x, xs):_ -> x : rowToCols xs

fromList :: [[a]] -> Matrix a
fromList xs = Matrix { cells = cells', rows = rows', cols = cols' }
    where cells' = V.fromList $ concat xs
          (rows', cols') = case xs of 
            (x:_) -> (length xs, length x)
            _ -> (0, 0)

transpose :: Matrix a -> Matrix a
transpose matrix = Matrix { cells = transposedCells, rows = cols', cols = rows' } where
    cells' = cells matrix
    cols' = cols matrix
    rows' = rows matrix
    transposedCells = V.backpermute cells' transposeIndices
    transposeIndices = V.generate (rows' * cols') transposeIndex
    transposeIndex index = row' * cols' + col' where
        (col', row') = index `quotRem` rows'

flatten :: Matrix a -> V.Vector a
flatten = cells