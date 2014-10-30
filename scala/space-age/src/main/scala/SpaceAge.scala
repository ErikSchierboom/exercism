case class SpaceAge(seconds: Long) {

  val SecondsInEarthYear = 31557600.0

  val EarthOrbitalPeriodInEarthYears = 1.0
  val MercuryOrbitalPeriodInEarthYears = 0.2408467
  val VenusOrbitalPeriodInEarthYears = 0.61519726
  val MarsOrbitalPeriodInEarthYears = 1.8808158
  val JupiterOrbitalPeriodInEarthYears = 11.862615
  val SaturnOrbitalPeriodInEarthYears = 29.447498
  val UranusOrbitalPeriodInEarthYears = 84.016846
  val NeptureOrbitalPeriodInEarthYears = 164.79132

  def round(number: Double, digits: Int) = Math.round(number * Math.pow(10, digits)) / Math.pow(10, digits)

  def getYears(orbitalPeriod: Double): Double = round(seconds.toDouble / (SecondsInEarthYear * orbitalPeriod), 2)

  def onEarth(): Double = getYears(EarthOrbitalPeriodInEarthYears)
  def onMercury(): Double = getYears(MercuryOrbitalPeriodInEarthYears)
  def onVenus(): Double = getYears(VenusOrbitalPeriodInEarthYears)
  def onMars(): Double = getYears(MarsOrbitalPeriodInEarthYears)
  def onJupiter(): Double = getYears(JupiterOrbitalPeriodInEarthYears)
  def onSaturn(): Double = getYears(SaturnOrbitalPeriodInEarthYears)
  def onUranus(): Double = getYears(UranusOrbitalPeriodInEarthYears)
  def onNeptune(): Double = getYears(NeptureOrbitalPeriodInEarthYears)
}
