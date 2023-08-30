module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven = 40

preparationTimeInMinutes numberOfLayers = numberOfLayers * 2

elapsedTimeInMinutes numberOfLayers actualTimeInOven = 
    actualTimeInOven + preparationTimeInMinutes numberOfLayers
