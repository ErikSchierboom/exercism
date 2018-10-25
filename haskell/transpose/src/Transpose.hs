module Transpose (transpose) where

import Data.List.Index (indexed, imap)
import Data.List (concatMap)

charactersWithColumn :: String -> [(Int, Char)]
charactersWithColumn str = indexed str

column :: [(Int, Char)] -> Int -> String
column charsWithColumn n = [char | (column, char) <- charsWithColumn, column == n]

transpose :: [String] -> [String]
transpose [] = []
transpose lines =
    let
        subsequentRowsMaximumLength n = maximum . map length . drop n $ lines
        padLine row line = line ++ replicate (subsequentRowsMaximumLength row - length line) ' '
        paddedLines = imap padLine lines
        charsWithColumn = concatMap charactersWithColumn paddedLines
        numberOfColumns = maximum . map fst $ charsWithColumn
    in
        map (column charsWithColumn) [0..numberOfColumns]