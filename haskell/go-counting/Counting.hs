module Counting (Color(..), territories, territoryFor) where

import Data.Maybe (catMaybes)
import Data.Set (Set)
import Data.Array.IArray (Array)

import qualified Data.Set as S
import qualified Data.Array.IArray as A

data Color = Black | White
	deriving (Eq, Ord, Show)

type Coord = (Int, Int)

type Board = Array Coord (Maybe Color)	

territories :: [[Char]] -> [(Set Coord, Maybe Color)]
territories input = territoriesHelper board emptyCoords [] where
	board = mkBoard input
	emptyCoords = emptyCoordinates board

territoriesHelper :: Board -> [Coord] -> [(Set Coord, Maybe Color)] -> [(Set Coord, Maybe Color)]
territoriesHelper _ [] acc = acc
territoriesHelper board empty@(coord:_) acc = territoriesHelper board remainder ((coords, owner) : acc) where
	coords = territory board coord
	owner = territoryOwner board coords
	remainder = S.toList $ S.difference (S.fromList empty) coords

territoryFor :: [[Char]] -> Coord -> Maybe (Set Coord, Maybe Color)
territoryFor input coord = if S.null coords then Nothing else Just (coords, owner) where
	board = mkBoard input
	coords = territory board coord
	owner = territoryOwner board coords

territory :: Board -> Coord -> Set Coord
territory board coord
	| isValidCoordinate board coord && isEmpty board coord = territoryHelper board [coord] (S.singleton coord)
	| otherwise = S.empty

territoryHelper :: Board -> [Coord] -> Set Coord -> Set Coord
territoryHelper _ [] acc = acc
territoryHelper board remainder acc = territoryHelper board newRemainder newAcc where
	emptyNeighbors = S.fromList $ concatMap (emptyNeighborCoordinates board) remainder
	newEmptyNeighbors = S.difference emptyNeighbors acc
	newRemainder = S.toList newEmptyNeighbors
	newAcc = S.union acc newEmptyNeighbors	

territoryOwner :: Board -> Set Coord -> Maybe Color
territoryOwner board coords = owner where
	neighborCoords = concatMap (nonEmptyNeighborCoordinates board) $ S.toList coords
	neighborColors = catMaybes $ map (board A.!) neighborCoords
	uniqueColors = S.fromList neighborColors
	owner = if S.size uniqueColors == 1 then Just (S.elemAt 0 uniqueColors) else Nothing

emptyCoordinates :: Board -> [Coord]    
emptyCoordinates board = filter (isEmpty board) (A.indices board)

neighborCoordinates :: Board -> Coord -> [Coord]    
neighborCoordinates board (col, row) = filter (isValidCoordinate board) coordinates where
	 coordinates = [(col, row-1), (col-1, row), (col+1, row), (col, row+1)]

nonEmptyNeighborCoordinates :: Board -> Coord -> [Coord]
nonEmptyNeighborCoordinates board = filter (not . isEmpty board) . neighborCoordinates board

emptyNeighborCoordinates :: Board -> Coord -> [Coord]
emptyNeighborCoordinates board = filter (isEmpty board) . neighborCoordinates board

isValidCoordinate :: Board -> Coord -> Bool
isValidCoordinate board (col, row) = row >= minRow && row <= maxRow && col >= minCol && col <= maxCol where
	((minCol, minRow), (maxCol, maxRow)) = A.bounds board

isEmpty :: Board -> Coord -> Bool
isEmpty board coord = board A.! coord == Nothing

mkBoard :: [[Char]] -> Board
mkBoard input = A.array bounds assocs where
	rows = length input
	cols = length $ head input
	bounds = ((1, 1), (cols, rows))	
	indices = [(col, row) | row <- [1..rows], col <- [1..cols]]
	colors = map charToColor $ concat input
	assocs = zip indices colors

charToColor :: Char -> Maybe Color
charToColor 'B' = Just Black
charToColor 'W' = Just White
charToColor  _  = Nothing