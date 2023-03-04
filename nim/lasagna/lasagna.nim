const expectedMinutesInOven* = 40;

func remainingMinutesInOven*(actualMinutesInOven: int): int =
    expectedMinutesInOven - actualMinutesInOven

func preparationTimeInMinutes*(numberOfLayers: int): int =
    numberOfLayers * 2;

func totalTimeInMinutes*(numberOfLayers, actualMinutesInOven: int): int =
    actualMinutesInOven + preparationTimeInMinutes(numberOfLayers)
