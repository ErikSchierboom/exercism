data class Clock(var hours: Int, var minutes: Int) {
    init {
        normalize()
    }

    fun add(minutes: Int) {
        this.minutes += minutes
        normalize()
    }

    private fun normalize() {
        infix fun Double.mod(other: Double) = ((this % other + other) % other).toInt()

        hours = (hours * 60 + minutes) / 60.0 mod 24.0
        minutes = minutes.toDouble() mod 60.0
    }

    override fun toString() = "${"%02d".format(hours)}:${"%02d".format(minutes)}"
}