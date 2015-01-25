module Robot (Bearing(..), Robot, mkRobot,
              coordinates, simulate,
              bearing, turnRight, turnLeft) where

data Bearing = North | East | South | West
    deriving (Show, Eq, Enum)

data Robot = Robot  { bearing :: Bearing, coordinates :: (Int, Int) }
    deriving (Show, Eq)

mkRobot :: Bearing -> (Int, Int) -> Robot
mkRobot newBearing newCoordinates = Robot { bearing = newBearing, coordinates = newCoordinates }

simulate :: Robot -> String -> Robot
simulate = foldl applyInstruction

applyInstruction :: Robot -> Char -> Robot
applyInstruction robot 'L' = mkRobot (turnLeft  $ bearing robot) $ coordinates robot
applyInstruction robot 'R' = mkRobot (turnRight $ bearing robot) $ coordinates robot
applyInstruction robot 'A' = mkRobot (bearing robot)             $ advance robot
applyInstruction _ _ = error "Invalid instruction"

turnRight :: Bearing -> Bearing
turnRight = modifyEnum (+1)

turnLeft :: Bearing -> Bearing
turnLeft = modifyEnum (subtract 1)

modifyEnum :: (Int -> Int) -> Bearing -> Bearing
modifyEnum apply = toEnum . flip mod 4 . apply . fromEnum

advance :: Robot -> (Int, Int)
advance robot = 
    case bearing robot of
        North -> (x,     y + 1)
        East  -> (x + 1, y)
        South -> (x,     y - 1)
        West  -> (x - 1, y) 
        where (x, y) = coordinates robot
    