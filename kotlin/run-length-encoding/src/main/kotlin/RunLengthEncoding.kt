object RunLengthEncoding {
    fun encode(input: String): String =
        input.encodeRuns().joinToString("") { (letter, count) -> letter.encode(count) }

    fun decode(input: String): String =
        input.decodeRuns().joinToString("") { (letter, count) -> letter.decode(count) }

    private fun Char.encode(count: Int) = if (count == 1) "$this" else "$count$this"

    private fun Char.decode(count: Int) = this.toString().repeat(count)

    private fun String.encodeRuns() =
        Regex("(.)\\1*").findAll(this).map { it.value[0] to it.value.length }

    private fun String.decodeRuns() =
        Regex("(\\d*)(.)").findAll(this).map { it.groupValues[2][0] to it.groupValues[1].ifEmpty { "1" }.toInt() }
}
