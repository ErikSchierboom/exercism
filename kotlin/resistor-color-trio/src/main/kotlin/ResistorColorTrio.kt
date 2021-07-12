import kotlin.math.pow

object ResistorColorTrio {
    fun text(vararg input: Color): String {
        val base = (10 * input[0].ordinal + input[1].ordinal)
        val exponent = 10.pow(input[2].ordinal)
        val ohms = base * exponent

        val unit = Unit.values().first { exponent < 1000.pow(it.ordinal + 1) }
        val unitModifier = Math.max(1000.pow(unit.ordinal - 1), 1)

        return "${ohms / unitModifier} ${unit.toString().toLowerCase()}"
    }

    private fun Int.pow(n: Int) = this.toDouble().pow(n).toInt()
}
