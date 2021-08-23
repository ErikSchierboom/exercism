private val ALPHABET = ('a'..'z').toList()

class Cipher(val key: String = Key.generate()) {
    init {
        require(Key.isValid(key))
    }

    fun encode(input: String) = input.shift(Int::plus)

    fun decode(input: String) = input.shift(Int::minus)

    private fun String.shift(op: (Int, Int) -> Int) =
        mapIndexed { i, c ->
            val alphabetIndex = ALPHABET.indexOf(c)
            val keyIndex = ALPHABET.indexOf(key[i.mod(key.length)])
            ALPHABET[op(alphabetIndex, keyIndex).mod(ALPHABET.size)]
        }.joinToString(separator = "")
}

object Key {
    fun generate() = List(100) { ALPHABET.random() }.joinToString(separator = "")

    fun isValid(key: String) = key.isNotEmpty() && key.all { it in ALPHABET }
}
