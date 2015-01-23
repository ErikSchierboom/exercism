module Robot (robotName, mkRobot, resetName) where

import System.Random (randomRIO)
import Data.IORef
import Control.Applicative  

newtype Robot = Robot { unRobot :: IORef String }

mkRobot :: IO Robot
mkRobot = Robot <$> (generateName >>= newIORef)

robotName :: Robot -> IO String
robotName = readIORef . unRobot

resetName :: Robot -> IO ()
resetName robot = generateName >>= writeIORef (unRobot robot)

generateName :: IO String
generateName = mapM randomRIO pattern
  where pattern = [letter, letter, digit, digit, digit]
        letter = ('A', 'Z')
        digit = ('0', '9')