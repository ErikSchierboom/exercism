object AffineCipher {
    private const val ALPHABET = "abcdefghijklmnopqrstuvwxyz"

    fun encode(input: String, a: Int, b: Int): String {
        require(a.coprime(ALPHABET.length)) { "a and m must be coprime." }

        return input
            .translate { a * it + b }
            .chunked(5)
            .joinToString(" ")
    }

    fun decode(input: String, a: Int, b: Int): String {
        require(a.coprime(ALPHABET.length)) { "a and m must be coprime." }

        val mmi = a.modularInverse(ALPHABET.length)
        return input.translate { mmi * (it - b) }
    }

    private fun String.translate(map: (Int) -> Int) =
        filter(Char::isLetterOrDigit)
            .toLowerCase()
            .map {
                val index = ALPHABET.indexOf(it)
                if (index == -1) it else ALPHABET[map(index).modulo(ALPHABET.length)]
            }
            .joinToString("")

}

private fun Int.modulo(m: Int) = (this % m + m) % m

private fun Int.modularInverse(b: Int) = toBigInteger().modInverse(b.toBigInteger()).toInt()

private fun Int.coprime(b: Int) = toBigInteger().gcd(b.toBigInteger()).toInt() == 1
