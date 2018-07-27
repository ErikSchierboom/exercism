object Hamming {
    fun compute(strand1: String, strand2: String): Int {
        require(strand1.length == strand2.length) { "left and right strands must be of equal length." }
        return strand1.zip(strand2).count { it.first != it.second }
    }
}