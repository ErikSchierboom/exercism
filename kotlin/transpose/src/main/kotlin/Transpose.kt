object Transpose {
    fun transpose(input: List<String>): List<String> {
        if (input.isEmpty())
            return emptyList()

        val rowLengths = input.map { it.length }
        fun maxWidth(from: Int) = rowLengths.drop(from).max() ?: 0

        val transposed = MutableList(maxWidth(0)) { "" }

        for (i in input.indices) {
            for (j in input[i].indices) {
                transposed[j] = transposed[j] + input[i][j]
            }

            for (k in input[i].length until maxWidth(i + 1)) {
                transposed[k] = transposed[k] + ' '
            }
        }

        return transposed
    }
}
