import java.util.*

class Robot {
    private val letters = ('A' to 'Z').toList()
    private val digits = ('0' to '9').toList()
    private val random = Random()

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

    private fun <T> List<T>.random() = this[random.nextInt(this.size)]
}