module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven :: Int
expectedMinutesInOven = 40

preparationTimeInMinutes :: Int -> Int
preparationTimeInMinutes numberOfLayers = numberOfLayers * 2

elapsedTimeInMinutes :: Int -> Int -> Int
elapsedTimeInMinutes numberOfLayers actualTimeInOven = 
    actualTimeInOven + preparationTimeInMinutes numberOfLayers
