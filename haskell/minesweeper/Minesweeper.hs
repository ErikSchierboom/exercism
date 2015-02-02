module Minesweeper (annotate) where

import Data.Char (intToDigit)
import Data.Maybe (catMaybes)
import qualified Data.Vector as V

data Cell = Mine | Empty deriving (Show, Eq)

data Board = Board { cells :: V.Vector Cell, rows :: Int, cols :: Int } deriving (Show, Eq)

mkBoard :: [String] -> Board
mkBoard input = Board { cells = cells', rows = rows', cols = cols' } where
    cells' = V.fromList $ concatMap parseCells input
    rows' = length input
    cols' = length $ head input

parseCells :: String -> [Cell]
parseCells = map parseCell

parseCell :: Char -> Cell
parseCell '*' = Mine
parseCell _   = Empty

cell :: Board -> (Int, Int) -> Maybe Cell
cell board position
    | isValid position = cells board V.!? cellIndex board position
    | otherwise = Nothing where
        isValid (row, col) = row >= 0 && row < rows board && col >= 0 && col < cols board

cellIndex :: Board -> (Int, Int) -> Int
cellIndex board (row, col) = (row * (cols board)) + col

neighborPositions :: (Int, Int) -> [(Int, Int)]
neighborPositions (row, col) = [(row - 1, col -1), (row - 1, col), (row - 1, col +1),
                                (row,     col -1),                 (row,     col +1),
                                (row + 1, col -1), (row + 1, col), (row + 1, col +1)]

neighborMines :: Board -> (Int, Int) -> Int 
neighborMines board position = length $ filter (== Mine) $ catMaybes $ map boardCell $ neighborPositions position where
    boardCell = cell board

rowOutput :: Board -> Int -> String
rowOutput board row = map (\col -> cellOutput board (row, col)) [0..(cols board) -1]

cellOutput :: Board -> (Int, Int) -> Char
cellOutput board position = case cell board position of
    Just Mine  -> '*'
    Just Empty -> case neighborMines board position of
        0 -> ' '
        x -> intToDigit x
    _ -> error "Invalid cell position"

annotate :: [String] -> [String]
annotate [] = []
annotate input = map (rowOutput board) [0..(rows board) -1] where
    board = mkBoard input