object CryptoSquare {
    fun ciphertext(plaintext: String) =
        if (plaintext.isEmpty()) "" else plaintext.normalize().rows().columns().joinToString(" ")

    private fun String.normalize() = filter { it.isLetterOrDigit() }.toLowerCase()
    private fun String.size() = Math.ceil(Math.sqrt(length.toDouble())).toInt()
    private fun String.rows(): List<String> = size().let { size -> chunked(size).map { it.padEnd(size) } }
    private fun List<String>.columns(): List<String> = this[0].indices.map { i -> this.map { it[i] }.joinToString("") }
}
