object Raindrops {
    fun convert(input: Int): String {
        val factors = listOf(3 to "Pling", 5 to "Plang", 7 to "Plong")
                .filter { input % it.first == 0 }
                .map { it.second }

        return if (factors.isEmpty()) input.toString() else factors.joinToString(separator = "")
    }
}