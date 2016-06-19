class SpaceAge(val seconds: Long) {

    val secondsOnEarth = 31557600L

    fun yearsUsingPeriod(period: Double): Double {
        val years = (seconds / period) / secondsOnEarth
        return Math.round(years * 100.0) / 100.0
    }

    fun onMercury(): Double = yearsUsingPeriod(0.2408467)
    fun onVenus(): Double = yearsUsingPeriod(0.61519726)
    fun onEarth(): Double = yearsUsingPeriod(1.0)
    fun onMars(): Double = yearsUsingPeriod(1.8808158)
    fun onJupiter(): Double = yearsUsingPeriod(11.862615)
    fun onSaturn(): Double = yearsUsingPeriod(29.447498)
    fun onUranus(): Double = yearsUsingPeriod(84.016846)
    fun onNeptune(): Double = yearsUsingPeriod(164.79132)
}
