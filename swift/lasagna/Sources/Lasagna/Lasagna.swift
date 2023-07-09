let expectedMinutesInOven = 40

func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    expectedMinutesInOven - elapsedMinutes;
}

func preparationTimeInMinutes(layers: Int) -> Int {
    layers * 2
}

func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    preparationTimeInMinutes(layers: layers) + elapsedMinutes
}
