module Matrix (saddlePoints) where

import Data.Ix (inRange)
import Data.Array (Array, indices,  accumArray, bounds, (!))

saddlePoints :: Array (Int, Int) Int -> [(Int, Int)]
saddlePoints matrix = filter isSaddlePoint $ indices matrix  where    
    (rowsMax, colsMin) = rowsMinColsMax matrix
    isSaddlePoint point@(row, col) = inRange (rowsMax ! row, colsMin ! col) (matrix ! point)

rowsMinColsMax :: Array (Int, Int) Int -> (Array Int Int, Array Int Int)
rowsMinColsMax matrix = (rowsMax, colsMin) where
	(_, (rows, cols)) = bounds matrix
	rowsMax = accumArray max (minBound :: Int) (0, rows) [(row, matrix ! (row, col)) | row <- [0..rows], col <- [0..cols]]
	colsMin = accumArray min (maxBound :: Int) (0, cols) [(col, matrix ! (row, col)) | row <- [0..rows], col <- [0..cols]]