import java.util.*

val random = Random()
val letters = ('a' .. 'z').toList()

private fun <T> List<T>.random() = this[random.nextInt(this.size)]

private fun modulo (x: Int, y: Int): Int = ((x % y) + y) % y

private fun charToInt (c: Char): Int = c - 'a'

private fun intToChar (i: Int): Char = 'a' + modulo(i, 26)

private fun generateKey() = (1..100).map { letters.random() }.joinToString(separator = "")

class Cipher(val key: String = generateKey()) {
    init {
        require(validKey())
    }

    private fun validKey(): Boolean = key.isNotEmpty() && key.all { it in letters }

    fun encode(input: String): String = shift(key, input) { x, y -> x + y}

    fun decode(input: String): String = shift(key, input) { x, y -> x - y}

    private fun shiftChar(key: Char, char: Char, operation: (Int, Int) -> Int): Char =
        intToChar(operation(charToInt(char), charToInt(key)))

    private fun shift (key: String, input: String, operation: (Int, Int) -> Int): String =
        key.zip(input).map { shiftChar(it.first, it.second, operation) }.joinToString(separator = "")
}