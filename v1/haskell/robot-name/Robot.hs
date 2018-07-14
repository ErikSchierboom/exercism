module Robot (robotName, mkRobot, resetName) where

import Control.Applicative ((<$>))
import Control.Concurrent (MVar, newMVar, readMVar, swapMVar)
import Control.Monad (void)
import System.Random (randomRIO)

newtype Robot = Robot { unRobot :: MVar String }

mkRobot :: IO Robot
mkRobot = Robot <$> (generateName >>= newMVar)

robotName :: Robot -> IO String
robotName = readMVar . unRobot

resetName :: Robot -> IO ()
resetName robot = void (generateName >>= swapMVar (unRobot robot))

generateName :: IO String
generateName = mapM randomRIO pattern
  where pattern = [letter, letter, digit, digit, digit]
        letter = ('A', 'Z')
        digit = ('0', '9')