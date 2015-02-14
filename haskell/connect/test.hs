import Data.Array.IArray (Array)
import Data.Set (Set)

import qualified Data.Array.IArray as A
import qualified Data.Set as S

data Color = Black | White deriving (Eq, Show)

type Coord = (Int, Int)

type Board = Array Coord (Maybe Color)

makeBoard :: [String] -> [String]
makeBoard = map (filter (/=' '))


blines = [". X X . ."
         ," X . X . X"
         ,"  . X . X ."
         ,"   . X X . ."
         ,"    O O O O O"
         ]

--main = print $ resultFor ["O"]
--main = print $ blackStart board where board =  mkBoard $ makeBoard blines
main = print $ adjacentBlack board (3, 2) where board =  mkBoard $ makeBoard blines

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
whiteWins board = any (validWhitePath board S.empty) (whiteStart board)

validWhitePath :: Board -> Set Coord -> Coord -> Bool
validWhitePath board processed coord@(_, row) 
	| row == rows board = True
	| null notVisited = False
	| otherwise = any (validWhitePath board (S.insert coord processed)) notVisited
	where next = adjacentWhite board coord
	      notVisited = S.toList $ S.difference (S.fromList next) processed

blackWins :: Board -> Bool
blackWins board = any (validBlackPath board S.empty) (blackStart board)

validBlackPath :: Board -> Set Coord -> Coord -> Bool
validBlackPath board processed coord@(col, _) 
	| col == cols board = True
	| null notVisited = False
	| otherwise = any (validBlackPath board (S.insert coord processed)) notVisited
	where next = adjacentBlack board coord
	      notVisited = S.toList $ S.difference (S.fromList next) processed

cols :: Board -> Int
cols board = cols' where (_, (cols', _)) = A.bounds board

rows :: Board -> Int
rows board = rows' where (_, (_, rows')) = A.bounds board

isValidCoordinate :: Board -> Coord -> Bool
isValidCoordinate board (col, row) = row >= minRow && row <= maxRow && col >= minCol && col <= maxCol where
	((minCol, minRow), (maxCol, maxRow)) = A.bounds board

hasColor :: Maybe Color -> Board -> Coord -> Bool
hasColor color board coord = board A.! coord == color

isWhite :: Board -> Coord -> Bool
isWhite = hasColor (Just White)

isBlack :: Board -> Coord -> Bool
isBlack = hasColor (Just Black)

whiteStart :: Board -> [Coord]
whiteStart board = [(col, 1) | col <- [1..cols board], isWhite board (col, 1)]
	
blackStart :: Board -> [Coord]
blackStart board = [(1, row) | row <- [1..rows board], isBlack board (1, row)]

adjacentWhite :: Board -> Coord -> [Coord]
adjacentWhite board = filter (isWhite board) . adjacent board

adjacentBlack :: Board -> Coord -> [Coord]
adjacentBlack board = filter (isBlack board) . adjacent board

adjacent :: Board -> Coord -> [Coord]
adjacent board (col, row) = filter (isValidCoordinate board) [
	(col + 1, row - 1), 
	(col,     row - 1), 
	(col - 1, row), 
	(col + 1, row), 
	(col - 1, row + 1),
    (col,     row + 1)]

charToColor :: Char -> Maybe Color
charToColor 'O' = Just White
charToColor 'X' = Just Black
charToColor  _  = Nothing