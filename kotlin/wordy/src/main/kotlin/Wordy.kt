import java.lang.IllegalStateException
import kotlin.math.pow

object Wordy {
    const val PREFIX = "What is "
    const val SUFFIX = "?"

    fun answer(input: String): Int {
        require(input.startsWith(PREFIX))
        require(input.endsWith(SUFFIX))

        val parts = input.drop(PREFIX.length).dropLast(SUFFIX.length).split(' ')
        val initial = parts[0].toInt()

        return evaluate(initial, parts.drop(1))
    }

    fun evaluate(acc: Int, unevaluated: List<String>): Int {
        if (unevaluated.isEmpty())
            return acc

        return when {
            unevaluated[0] == "plus" -> evaluate(acc + unevaluated[1].toInt(), unevaluated.drop(2))
            unevaluated[0] == "minus" -> evaluate(acc - unevaluated[1].toInt(), unevaluated.drop(2))
            unevaluated[0] == "multiplied" && unevaluated[1] == "by" -> evaluate(acc * unevaluated[2].toInt(), unevaluated.drop(3))
            unevaluated[0] == "divided" && unevaluated[1] == "by" -> evaluate(acc / unevaluated[2].toInt(), unevaluated.drop(3))
            unevaluated[0] == "raised" && unevaluated[1] == "to" && unevaluated[2] == "the" && unevaluated[4] == "power" -> evaluate(acc.pow(unevaluated[3].replace("th", "").toInt()), unevaluated.drop(5))
            else -> throw IllegalStateException("Invalid equation")
        }
    }

    private fun Int.pow(n: Int) = toDouble().pow(n).toInt()
}
