object CollatzCalculator {
    fun computeStepCount(i: Int): Int {
        require(i > 0) { "Only natural numbers are allowed" }

        val collatzSteps = generateSequence(i) {
            when {
                it == 1 -> null
                it % 2 == 0 -> it / 2
                else -> it * 3 + 1
            }
        }
        return collatzSteps.count() - 1
    }
}