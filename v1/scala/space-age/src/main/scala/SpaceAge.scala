case class SpaceAge(seconds: Long) {

  val SecondsInEarthYear = 31557600.0

  val EarthOrbitalPeriodInEarthYears = 1.0
  val MercuryOrbitalPeriodInEarthYears = 0.2408467
  val VenusOrbitalPeriodInEarthYears = 0.61519726
  val MarsOrbitalPeriodInEarthYears = 1.8808158
  val JupiterOrbitalPeriodInEarthYears = 11.862615
  val SaturnOrbitalPeriodInEarthYears = 29.447498
  val UranusOrbitalPeriodInEarthYears = 84.016846
  val NeptuneOrbitalPeriodInEarthYears = 164.79132

  def round(number: Double, digits: Int) = Math.round(number * Math.pow(10, digits)) / Math.pow(10, digits)

  def getYears(orbitalPeriod: Double): Double = round(seconds.toDouble / (SecondsInEarthYear * orbitalPeriod), 2)

  lazy val onEarth = getYears(EarthOrbitalPeriodInEarthYears)
  lazy val onMercury = getYears(MercuryOrbitalPeriodInEarthYears)
  lazy val onVenus = getYears(VenusOrbitalPeriodInEarthYears)
  lazy val onMars = getYears(MarsOrbitalPeriodInEarthYears)
  lazy val onJupiter = getYears(JupiterOrbitalPeriodInEarthYears)
  lazy val onSaturn = getYears(SaturnOrbitalPeriodInEarthYears)
  lazy val onUranus = getYears(UranusOrbitalPeriodInEarthYears)
  lazy val onNeptune = getYears(NeptuneOrbitalPeriodInEarthYears)
}
