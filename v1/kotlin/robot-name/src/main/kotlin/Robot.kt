import java.util.*

val random = Random()
val letters = ('A' to 'Z').toList()
val digits = ('0' to '9').toList()

fun <T> List<T>.random() = this[random.nextInt(this.size)]

class Robot {
    var name: String

    init {
        name = generateName();
    }

    fun reset() {
        name = generateName();
    }

    fun generateName(): String =
            listOf(letters.random(),letters.random(), digits.random(), digits.random(), digits.random())
                    .joinToString(separator = "")
}