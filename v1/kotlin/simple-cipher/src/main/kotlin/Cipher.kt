import java.util.*

val random = Random()
val letters = ('a' .. 'z').toList()

fun <T> List<T>.random() = this[random.nextInt(this.size)]

fun generateKey() = (1..100).map { letters.random() }.joinToString(separator = "")

class Cipher(val key: String) {

    constructor(): this(generateKey()) {}

    init {
        if (invalidKey())
            throw IllegalArgumentException()
    }

    fun invalidKey(): Boolean = key.isEmpty() || key.any { it !in letters }

    fun modulo (x: Int, y: Int): Int = ((x % y) + y) % y

    fun charToInt (c: Char): Int = c - 'a'
    fun intToChar (i: Int): Char = 'a' + modulo(i, 26)

    fun shiftChar(key: Char, char: Char, operation: (Int, Int) -> Int): Char =
        intToChar(operation(charToInt(char), charToInt(key)))

    fun shift (key: String, input: String, operation: (Int, Int) -> Int): String =
        key.zip(input).map { shiftChar(it.first, it.second, operation) }.joinToString(separator = "")

    fun encode(input: String): String = shift(key, input) { x, y -> x + y}

    fun decode(input: String): String = shift(key, input) { x, y -> x - y}
}