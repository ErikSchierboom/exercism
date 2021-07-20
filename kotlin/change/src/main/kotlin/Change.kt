class ChangeCalculator(private val coins: List<Int>) {
    fun computeMostEfficientChange(amount: Int): List<Int> {
        require(amount >= 0) { "Negative totals are not allowed." }

        return 1.rangeTo(amount)
            .fold(mapOf(0 to listOf()), this::calculateMostEfficientChangeForAmount)
            .getOrElse(amount) { throw IllegalArgumentException("The total $amount cannot be represented in the given currency.\"") }
    }

    private fun calculateMostEfficientChangeForAmount(map: Map<Int, List<Int>>, amount: Int) =
        mostEfficientChange(map, amount)?.let { change -> map + (amount to change) } ?: map

    private fun mostEfficientChange(map: Map<Int, List<Int>>, amount: Int) =
        coins.filter { it <= amount }
            .mapNotNull { map[amount - it]?.let { change -> listOf(it) + change }  }
            .minByOrNull { it.size }
}