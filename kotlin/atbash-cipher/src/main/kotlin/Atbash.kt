fun <T> List<T>.chunkBySize(size: Int) =
    (0..lastIndex / size).map {
        val fromIndex = it * size
        val toIndex = Math.min(fromIndex + size, this.size)
        subList(fromIndex, toIndex)
    }

object Atbash {
    val letters = 'a' .. 'z'
    val encodingMap = letters.zip(letters.reversed()).toMap()

    fun encodeChar(c: Char) = encodingMap.getOrElse(c) { c }

    fun encode(input: String): String =
            input.toLowerCase()
                 .replace(Regex("[^a-zA-Z0-9]"), "")
                 .map { encodeChar(it) }
                 .chunkBySize(5)
                 .map { it.joinToString(separator = "") }
                 .joinToString(separator = " ")

    fun decode(input: String): String = encode(input).replace(" ", "")
}