import kotlin.math.pow

object Darts {
    fun score(x: Number, y: Number): Int {
        val distance = Math.sqrt(x.toDouble().pow(2) + y.toDouble().pow(2))
        return when {
            distance <= 1.0  -> 10
            distance <= 5.0  -> 5
            distance <= 10.0 -> 1
            else -> 0
        }
    }
}
