object Atbash {
    private val letters = 'a'..'z'
    private val encodingMap = letters.zip(letters.reversed()).toMap()

    fun encode(input: String) =
        input.toLowerCase()
            .filter(Char::isLetterOrDigit)
            .chunked(5)
            .map { chunk -> chunk.map { it.encode() }.joinToString("") }
            .joinToString(separator = " ")

    fun decode(input: String) = encode(input).filter(Char::isLetterOrDigit)

    private fun Char.encode() = encodingMap.getOrElse(this) { this }
}