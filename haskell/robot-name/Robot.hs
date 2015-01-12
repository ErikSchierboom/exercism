module Robot (robotName, mkRobot, resetName) where

import System.Random (randomRIO)
import Data.IORef
import Control.Applicative  

data Robot = Robot { name :: IORef String }

mkRobot :: IO Robot
mkRobot = Robot <$> (generateName >>= newIORef)

robotName :: Robot -> IO String
robotName = readIORef . name

resetName :: Robot -> IO ()
resetName robot = generateName >>= writeIORef (name robot)

generateName :: IO String
generateName = mapM randomRIO pattern
  where pattern = [letter, letter, digit, digit, digit]
        letter = ('A', 'Z')
        digit = ('0', '9')