import kotlin.math.roundToInt

class SpaceAge(private val seconds: Long) {
    fun onMercury() = fromPeriodInEarthYears(0.2408467)
    fun onVenus() = fromPeriodInEarthYears(0.61519726)
    fun onEarth() = fromPeriodInEarthYears(1.0)
    fun onMars() = fromPeriodInEarthYears(1.8808158)
    fun onJupiter() = fromPeriodInEarthYears(11.862615)
    fun onSaturn() = fromPeriodInEarthYears(29.447498)
    fun onUranus() = fromPeriodInEarthYears(84.016846)
    fun onNeptune() = fromPeriodInEarthYears(164.79132)

    private fun fromPeriodInEarthYears(period: Double) = seconds.div(period).div(SECONDS_ON_EARTH).round()
    private fun Double.round() = times(100.0).roundToInt().div(100.0)
}

private const val SECONDS_ON_EARTH = 31_557_600L
