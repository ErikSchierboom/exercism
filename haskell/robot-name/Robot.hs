module Robot (robotName, mkRobot, resetName) where

import System.Random (randomRIO)
import Data.IORef

data Robot = Robot { name :: IORef String }

mkRobot :: IO Robot
mkRobot = do newName <- generateName
             nameRef <- newIORef newName
             return (Robot nameRef)

robotName :: Robot -> IO String
robotName robot = do name' <- readIORef (name robot)
                     return name'

resetName :: Robot -> IO ()
resetName robot = do newName <- generateName
                     writeIORef (name robot) newName

generateName :: IO String
generateName = mapM randomRIO pattern
  where pattern = [letter, letter, digit, digit, digit]
        letter = ('A', 'Z')
        digit = ('0', '9')