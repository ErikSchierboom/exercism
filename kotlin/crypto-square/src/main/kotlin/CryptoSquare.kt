import java.util.*
import kotlin.math.ceil
import kotlin.math.sqrt

object CryptoSquare {
    fun ciphertext(plaintext: String) =
        if (plaintext.isEmpty()) "" else plaintext.normalize().rows().columns().joinToString(" ")

    private fun String.normalize() = filter(Char::isLetterOrDigit).lowercase(Locale.getDefault())
    private fun String.size() = ceil(sqrt(length.toDouble())).toInt()
    private fun String.rows() = size().let { size -> chunked(size).map { it.padEnd(size) } }
    private fun List<String>.columns() = this[0].indices.map { i -> this.map { it[i] }.joinToString("") }
}
