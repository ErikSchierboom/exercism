module GoCounting

//type Color = Black | White
//type Coord = int * int
//type Board = Color option [][]
//
//let charToColor =
//    function
//    | 'B' -> Some Black
//    | 'W' -> Some White
//    | _   -> None
//
//let isEmpty (board: Board) (col, row) = board.[col].[row] = None
//
//// emptyCoordinates :: Board -> [Coord]    
//let emptyCoordinates (board: Board) = List.concat  filter (isEmpty board) (A.indices board)
//
////let board = Array2D.create 2 2 (None: Color option)
////board.[0, 0] <- Some Black
//
////let b = isEmpty board (1, 0)
//
//// neighborCoordinates :: Board -> Coord -> [Coord]    
//// neighborCoordinates board (col, row) = filter (isValidCoordinate board) coordinates where
////   coordinates = [(col, row-1), (col-1, row), (col+1, row), (col, row+1)]
//
//// nonEmptyNeighborCoordinates :: Board -> Coord -> [Coord]
//// nonEmptyNeighborCoordinates board = filter (not . isEmpty board) . neighborCoordinates board
//
//// emptyNeighborCoordinates :: Board -> Coord -> [Coord]
//// emptyNeighborCoordinates board = filter (isEmpty board) . neighborCoordinates board
//
//// isValidCoordinate :: Board -> Coord -> Bool
//// isValidCoordinate board (col, row) = row >= minRow && row <= maxRow && col >= minCol && col <= maxCol where
////  ((minCol, minRow), (maxCol, maxRow)) = A.bounds board
//
//
//
//
//
//// territories :: [[Char]] -> [(Set Coord, Maybe Color)]
//// territories input = territoriesHelper board emptyCoords [] where
////  board = mkBoard input
////  emptyCoords = emptyCoordinates board
//
//// territoriesHelper :: Board -> [Coord] -> [(Set Coord, Maybe Color)] -> [(Set Coord, Maybe Color)]
//// territoriesHelper _ [] acc = acc
//// territoriesHelper board empty@(coord:_) acc = territoriesHelper board remainder ((coords, owner) : acc) where
////  coords = territory board coord
////  owner = territoryOwner board coords
////  remainder = S.toList $ S.difference (S.fromList empty) coords
//
//// territoryFor :: [[Char]] -> Coord -> Maybe (Set Coord, Maybe Color)
//// territoryFor input coord = if S.null coords then Nothing else Just (coords, owner) where
////  board = mkBoard input
////  coords = territory board coord
////  owner = territoryOwner board coords
//
//// territory :: Board -> Coord -> Set Coord
//// territory board coord
////  | isValidCoordinate board coord && isEmpty board coord = territoryHelper board [coord] (S.singleton coord)
////  | otherwise = S.empty
//
//// territoryHelper :: Board -> [Coord] -> Set Coord -> Set Coord
//// territoryHelper _ [] acc = acc
//// territoryHelper board remainder acc = territoryHelper board newRemainder newAcc where
////  emptyNeighbors = S.fromList $ concatMap (emptyNeighborCoordinates board) remainder
////  newEmptyNeighbors = S.difference emptyNeighbors acc
////  newRemainder = S.toList newEmptyNeighbors
////  newAcc = S.union acc newEmptyNeighbors  
//
//// territoryOwner :: Board -> Set Coord -> Maybe Color
//// territoryOwner board coords = owner where
////  neighborCoords = concatMap (nonEmptyNeighborCoordinates board) $ S.toList coords
////  neighborColors = catMaybes $ map (board A.!) neighborCoords
////  uniqueColors = S.fromList neighborColors
////  owner = if S.size uniqueColors == 1 then Just (S.elemAt 0 uniqueColors) else Nothing
//
//
//
//// mkBoard :: [[Char]] -> Board
//// mkBoard input = A.array bounds assocs where
////  rows = length input
////  cols = length $ head input
////  bounds = ((1, 1), (cols, rows)) 
////  indices = [(col, row) | row <- [1..rows], col <- [1..cols]]
////  colors = map charToColor $ concat input
////  assocs = zip indices colors
//
//
//type Coord = (Int, Int)
//
//-- Helper for invoking 'territories' and getting an easy to compare result.
//terrs :: [[Char]] -> [([Coord], Maybe Color)]
//terrs = sort . map worker . territories
//  where
//    worker (s, o) = (Set.toAscList s, o)
//
//-- Helper for invoking 'territoryFor' and getting an easy to compare
//-- result.
//terrFor :: [[Char]] -> Coord -> Maybe ([Coord], Maybe Color)
//terrFor b c = case territoryFor b c of
//                  Nothing     -> Nothing
//                  Just (s, o) -> Just (Set.toAscList s, o)
//
//-- | The score for black, white and none respectively.
//data Score = Score {
//    scoreBlack :: !Int,
//    scoreWhite :: !Int,
//    scoreNone  :: !Int
//} deriving (Eq, Show)
//
//-- Board to points: black, white, none.
//score :: [[Char]] -> Score
//score = foldl' worker (Score 0 0 0) . territories
//  where
//    worker sc (s, Just Black) = sc { scoreBlack = scoreBlack sc + Set.size s }
//    worker sc (s, Just White) = sc { scoreWhite = scoreWhite sc + Set.size s }
//    worker sc (s, Nothing)    = sc { scoreNone  = scoreNone sc  + Set.size s }
//
//board5x5 :: [[Char]]
//board5x5 =
//    ["  B  ",
//     " B B ",
//     "B W B",
//     " W W ",
//     "  W  "]
//
//board9x9 :: [[Char]]
//board9x9 =
//    ["  B   B  ",
//     "B   B   B",
//     "WBBBWBBBW",
//     "W W W W W",
//     "         ",
//     " W W W W ",
//     "B B   B B",
//     " W BBB W ",
//     "   B B   "]
//
//countingTests :: [Test]
//countingTests =
//    [ testCase "minimal board, no territories" $
//        [] @=? terrs ["B"],
//      testCase "one territory, covering the whole board" $
//        [([(1,1)], Nothing)] @=? terrs [" "],
//      testCase "two territories, rectangular board" $
//        [([(1,1), (1,2)], Just Black),
//         ([(4,1), (4,2)], Just White)]
//        @=? terrs [" BW ", " BW "],
//      testCase "5x5 score" $
//        Score 6 1 9 @=? score board5x5,
//      testCase "5x5 territory for black" $
//        Just ([(1,1), (1,2), (2,1)], Just Black)
//        @=? terrFor board5x5 (1,2),
//      testCase "5x5 territory for white" $
//        Just ([(3,4)], Just White)
//        @=? terrFor board5x5 (3,4),
//      testCase "5x5 open territory" $
//        Just ([(1,4), (1,5), (2,5)], Nothing)
//        @=? terrFor board5x5 (2,5),
//      testCase "5x5 non-territory (stone)" $
//        Nothing @=? terrFor board5x5 (2,2),
//      testCase "5x5 non-territory (too low coordinate)" $
//        Nothing @=? terrFor board5x5 (0,2),
//      testCase "5x5 non-territory (too high coordinate)" $
//        Nothing @=? terrFor board5x5 (2,6),
//      testCase "9x9 score" $
//        Score 14 0 33 @=? score board9x9
//    ]
