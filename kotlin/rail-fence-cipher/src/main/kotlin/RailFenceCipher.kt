class RailFenceCipher(private val rails: Int) {
    fun getEncryptedData(plainText: String): String =
        plainText.asSequence().zip(tracks.take(plainText.length))
                .sortedBy { it.second }
                .map { it.first }
                .joinToString("")

    fun getDecryptedData(cipherText: String): String =
        tracks.take(cipherText.length)
                .mapIndexed { index, track -> index to track }
                .toList()
                .sortedBy { it.second }
                .map { it.first }
                .zip(cipherText.asIterable())
                .sortedBy { it.first }
                .map { it.second }
                .joinToString("")

    private val tracks = sequence {
        var current = 0
        var up = true

        while (true) {
            yield(current)
            current = if (up) current + 1 else current - 1
            up = if (up) current < rails - 1 else current == 0
        }
    }
}