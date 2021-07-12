import kotlin.math.pow

object ResistorColorTrio {
    fun text(vararg input: Color): String {
        val ohms = (10 * input[0].ordinal + input[1].ordinal) * (10.0.pow(input[2].ordinal).toInt())
        return when {
            ohms >= 1_000_000 -> "${ohms / 1_000_000} megaohms"
            ohms >= 1_000 -> "${ohms / 1_000} kiloohms"
            else -> "${ohms} ohms"
        }
    }
}
