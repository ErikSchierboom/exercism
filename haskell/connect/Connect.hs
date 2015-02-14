module Connect (resultFor, Color(Black, White)) where

import Data.Array.IArray (Array)
import Data.Set (Set)

import qualified Data.Array.IArray as A
import qualified Data.Set as S

data Color = Black | White deriving (Eq, Show)

type Coord = (Int, Int)

type Board = Array Coord (Maybe Color)

resultFor :: [String] -> Maybe Color
resultFor input
	| whiteWins board = Just White 
	| blackWins board = Just Black
	| otherwise = Nothing
	where board = mkBoard input

mkBoard :: [String] -> Board
mkBoard input = A.array bounds assocs where
	rows' = length input
	cols' = length $ head input
	bounds = ((1, 1), (cols', rows'))
	indices = [(col, row) | row <- [1..rows'], col <- [1..cols']]
	colors = map charToColor $ concat input
	assocs = zip indices colors

whiteWins :: Board -> Bool
whiteWins = colorWins White isWhiteStop whiteStart

blackWins :: Board -> Bool
blackWins = colorWins Black isBlackStop blackStart

colorWins :: Color -> (Board -> Coord -> Bool) -> (Board -> [Coord]) -> Board -> Bool
colorWins color stop start board = any (validPath color stop board S.empty) (start board)

validPath :: Color -> (Board -> Coord -> Bool) -> Board -> Set Coord -> Coord -> Bool
validPath color stop board processed coord
	| stop board coord = True
	| null notVisited = False
	| otherwise = any (validPath color stop board (S.insert coord processed)) notVisited
	where next = adjacent color board coord
	      notVisited = S.toList $ S.difference (S.fromList next) processed

cols :: Board -> Int
cols board = cols' where (_, (cols', _)) = A.bounds board

rows :: Board -> Int
rows board = rows' where (_, (_, rows')) = A.bounds board

isValidCoordinate :: Board -> Coord -> Bool
isValidCoordinate board (col, row) = row >= minRow && row <= maxRow && col >= minCol && col <= maxCol where
	((minCol, minRow), (maxCol, maxRow)) = A.bounds board

hasColor :: Color -> Board -> Coord -> Bool
hasColor color board coord = board A.! coord == Just color

isWhiteStop :: Board -> Coord -> Bool
isWhiteStop board (_, row) = row == rows board

isBlackStop :: Board -> Coord -> Bool
isBlackStop board (col, _) = col == cols board

whiteStart :: Board -> [Coord]
whiteStart board = [(col, 1) | col <- [1..cols board], hasColor White board (col, 1)]
	
blackStart :: Board -> [Coord]
blackStart board = [(1, row) | row <- [1..rows board], hasColor Black board (1, row)]

adjacent :: Color -> Board -> Coord -> [Coord]
adjacent color board (col, row) = filter valid coords where
	valid coord = isValidCoordinate board coord && hasColor color board coord
	coords = [
		(col + 1, row - 1), 
		(col,     row - 1), 
		(col - 1, row), 
		(col + 1, row), 
		(col - 1, row + 1),
	    (col,     row + 1)
	   ]

charToColor :: Char -> Maybe Color
charToColor 'O' = Just White
charToColor 'X' = Just Black
charToColor  _  = Nothing