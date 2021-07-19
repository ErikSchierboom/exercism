private const val LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
private const val DIGITS = "0123456789"

class Robot {
    var name: String = RobotName.random()

    fun reset() {
        name = RobotName.random()
    }
}

object RobotName {
    private var index = 0;
    private val names = LETTERS.flatMap { l1 ->
        LETTERS.flatMap { l2 ->
            DIGITS.flatMap { d1 ->
                DIGITS.flatMap { d2 -> DIGITS.map { d3 -> "$l1$l2$d1$d2$d3" } }
            }
        }
    }.shuffled()

    fun random() = names[index++]
}