object Raindrops {
    private val factors = listOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

    fun convert(input: Int): String {
        val raindrops = factors.filter { input % it.first == 0 }.map { it.second }.joinToString("")
        return if (raindrops.isNotEmpty()) raindrops else input.toString()
    }
}