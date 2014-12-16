module Robot (robotName, mkRobot, resetName) where

import System.Random (randomRIO)

data Robot = Robot { name :: String }

mkRobot :: IO Robot
mkRobot = generateName >>= \name -> return (Robot name)

robotName :: Robot -> IO String
robotName robot = return $ name robot

resetName :: Robot -> IO String
resetName robot = generateName >>= \name -> return name

generateName :: IO String
generateName = mapM randomRIO pattern
  where pattern = [letter, letter, digit, digit, digit]
        letter = ('A', 'Z')
        digit = ('0', '9')