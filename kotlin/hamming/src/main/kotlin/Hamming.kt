object Hamming {
    fun compute(strand1: String, strand2: String): Int {
        if (strand1.length != strand2.length) throw IllegalArgumentException()

        return strand1.toCharArray().zip(strand2.toCharArray()).sumBy { if (it.first == it.second) 0 else 1 }
    }
}