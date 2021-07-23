import java.time.Duration

data class Clock(private var minutesInDay: Int) {
    constructor(hours: Int, minutes: Int) : this(hours.times(MINUTES_PER_HOUR).plus(minutes).toMinutesInDay())

    fun add(minutes: Int) {
        minutesInDay = minutesInDay.plus(minutes).toMinutesInDay()
    }

    fun subtract(minutes: Int) {
        minutesInDay = minutesInDay.minus(minutes).toMinutesInDay()
    }

    override fun toString() = "${hours.formatted()}:${minutes.formatted()}"

    private val hours get() = minutesInDay.div(MINUTES_PER_HOUR)
    private val minutes get() = minutesInDay.modulo(MINUTES_PER_HOUR)

}

private fun Int.modulo(other: Int) = (this % other + other) % other
private fun Int.formatted() = "%02d".format(this)
private fun Int.toMinutesInDay() = modulo(MINUTES_PER_DAY)

private val MINUTES_PER_DAY = Duration.ofDays(1).toMinutes().toInt()
private val MINUTES_PER_HOUR = Duration.ofHours(1).toMinutes().toInt()
