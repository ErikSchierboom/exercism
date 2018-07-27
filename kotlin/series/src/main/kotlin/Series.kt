object Series {
    fun slices(size: Int, input: String): List<List<Int>> {
        val digits = input.map { Integer.parseInt(it.toString()) }

        return (0 .. digits.size - size).map { digits.subList(it, it + size) }
    }
}