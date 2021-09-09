module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven actualMinutes = expectedMinutesInOven - actualMinutes

let preparationTimeInMinutes numberOfLayers = numberOfLayers * 2

let elapsedTimeInMinutes numberOfLayers actualMinutes = preparationTimeInMinutes numberOfLayers + actualMinutes
