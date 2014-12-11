module Robot (robotName, mkRobot, resetName) where

import System.Random (newStdGen, randomRs)

data Robot = Robot { name :: String }

mkRobot :: IO Robot
mkRobot = do return Robot { name = "test" }

robotName :: Robot -> IO String
robotName robot = do return $ name robot

resetName :: Robot -> IO ()
resetName robot = undefined

generateName :: IO String
generateName = do
	gen <- newStdGen
	letters <- (take 2 (randomRs ('A','Z') gen))
	gen' <- newStdGen
	numbers <- (take 3 (randomRs ('0','9') gen'))
	return (letters ++ numbers)