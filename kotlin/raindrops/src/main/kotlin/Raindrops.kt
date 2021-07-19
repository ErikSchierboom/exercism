object Raindrops {
    private val factors = mapOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

    fun convert(input: Int) =
        factors
            .filter { input % it.key == 0 }
            .map { it.value }
            .joinToString("")
            .ifEmpty { input.toString() }
}