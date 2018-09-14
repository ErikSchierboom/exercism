object Atbash {
    val letters = 'a'..'z'
    val encodingMap = letters.zip(letters.reversed()).toMap()

    fun encode(input: String): String =
            input.toLowerCase()
                    .replace(Regex("[^a-z0-9]"), "")
                    .chunked(5)
                    .map { it.map(this::encodeChar).joinToString("") }
                    .joinToString(separator = " ")

    fun decode(input: String): String = encode(input).replace(" ", "")

    private fun encodeChar(c: Char): Char = encodingMap.getOrElse(c) { c }
}