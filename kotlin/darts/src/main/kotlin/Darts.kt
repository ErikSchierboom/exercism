import kotlin.math.hypot

object Darts {
    fun score(x: Number, y: Number): Int {
        val distance = hypot(x.toDouble(), y.toDouble())
        return when {
            distance <= 1.0  -> 10
            distance <= 5.0  -> 5
            distance <= 10.0 -> 1
            else -> 0
        }
    }
}
