class Lasagna {
  def expectedMinutesInOven() = 40

  def remainingMinutesInOven(actualMinutesInOven: Int) = expectedMinutesInOven - actualMinutesInOven

  def preparationTimeInMinutes(numberOfLayers: Int) = numberOfLayers * 2

  def elapsedTimeInMinutes(numberOfLayers: Int, actualMinutesInOven: Int) =
    preparationTimeInMinutes(numberOfLayers) + actualMinutesInOven
}
