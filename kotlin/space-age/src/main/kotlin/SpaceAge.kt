import kotlin.math.roundToInt

private const val SECONDS_ON_EARTH = 31557600L

class SpaceAge(private val seconds: Long) {
    fun onMercury(): Double = fromEarthYears(0.2408467)
    fun onVenus(): Double = fromEarthYears(0.61519726)
    fun onEarth(): Double = fromEarthYears(1.0)
    fun onMars(): Double = fromEarthYears(1.8808158)
    fun onJupiter(): Double = fromEarthYears(11.862615)
    fun onSaturn(): Double = fromEarthYears(29.447498)
    fun onUranus(): Double = fromEarthYears(84.016846)
    fun onNeptune(): Double = fromEarthYears(164.79132)

    private fun fromEarthYears(period: Double) = seconds.div(period).div(SECONDS_ON_EARTH).round()
    private fun Double.round() = this.times(100.0).roundToInt().div(100.0)
}