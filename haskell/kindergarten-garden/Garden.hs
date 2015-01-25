module Garden (garden, defaultGarden, lookupPlants, Plant(..)) where

import Data.List (sort)
import Data.List.Split (chunksOf)
import Data.Map (Map, fromList, findWithDefault)

data Plant = Violets | Radishes | Clover | Grass
    deriving (Show, Eq)

plantsPerChildPerRow :: Int
plantsPerChildPerRow = 2

defaultChildren :: [String]
defaultChildren = ["Alice", "Bob", "Charlie", "David",
                   "Eve", "Fred", "Ginny", "Harriet",
                   "Ileana", "Joseph", "Kincaid", "Larry"] 

garden :: [String] -> String -> Map String [Plant]
garden children windowSills = fromList $ zipWith3 (\child plants1 plants2 -> (child, plants1 ++ plants2)) (sort children) row1 row2
    where rows = lines windowSills
          row1 = plantsInRow $ head rows
          row2 = plantsInRow $ last rows

defaultGarden :: String -> Map String [Plant]
defaultGarden = garden defaultChildren  

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants child plantsMap = findWithDefault [] child plantsMap

plantFromCode :: Char -> Plant
plantFromCode 'V' = Violets
plantFromCode 'R' = Radishes
plantFromCode 'C' = Clover
plantFromCode 'G' = Grass
plantFromCode _   = error "Invalid plant code"

plantsInRow :: String -> [[Plant]]
plantsInRow = chunksOf plantsPerChildPerRow . map plantFromCode