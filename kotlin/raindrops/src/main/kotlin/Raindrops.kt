object Raindrops {
    private val factors = mapOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

    fun convert(n: Int) =
        factors.entries
            .filter { n % it.key == 0 }
            .joinToString("") { it.value }
            .ifEmpty { n.toString() }
}