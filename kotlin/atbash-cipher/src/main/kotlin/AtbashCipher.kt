object Atbash {
    private val letters = 'a'..'z'
    private val encodingMap = letters.zip(letters.reversed()).toMap()

    fun encode(input: String): String =
        input.normalize()
            .chunked(5)
            .map { it.map { it.encode() }.joinToString("") }
            .joinToString(separator = " ")

    fun decode(input: String): String = encode(input).replace(" ", "")

    private fun String.normalize() = toLowerCase().replace(Regex("[^a-z0-9]"), "")
    private fun Char.encode() = encodingMap.getOrElse(this) { this }
}