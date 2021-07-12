import kotlin.math.pow

object ResistorColorTrio {
    fun text(vararg input: Color): String {
        val base = (10 * input[0].ordinal + input[1].ordinal)
        val exponent = 10.0.pow(input[2].ordinal).toInt()
        val ohms = base * exponent

        val unit = Unit.values().first { exponent < 1000.0.pow(it.ordinal + 1) }
        val unitModifier = Math.max(1000.0.pow(unit.ordinal - 1).toInt(), 1)

        return "${ohms / unitModifier} ${unit.toString().toLowerCase()}"
    }
}
