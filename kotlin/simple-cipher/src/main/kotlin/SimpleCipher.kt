const val ALPHABET = "abcdefghijklmnopqrstuvwxyz"

class Cipher(val key: String = Key.generate()) {
    init {
        require(Key.isValid(key))
    }

    fun encode(input: String) = input.shift(Int::plus)

    fun decode(input: String) = input.shift(Int::minus)

    private fun String.shift(op: (Int, Int) -> Int) =
        mapIndexed { i, c ->
            val alphabetIndex = ALPHABET.indexOf(c)
            val keyIndex = ALPHABET.indexOf(key[i.modulo(key.length)])
            ALPHABET[op(alphabetIndex, keyIndex).modulo(ALPHABET.length)]
        }.joinToString(separator = "")

    private fun Int.modulo(other: Int) = ((this % other) + other) % other
}

object Key {
    fun generate() = ALPHABET.random(length = 100)

    fun isValid(key: String) = key.isNotEmpty() && key.all { it in ALPHABET }

    private fun String.random(length: Int) = 0.until(length).map { random() }.joinToString(separator = "")
}
