object CollatzCalculator {
    fun computeStepCount(i: Int): Int {
        require(i > 0) { "Only natural numbers are allowed" }

        var steps = 0;
        var remainder = i;

        while (remainder != 1)
        {
            remainder = if (remainder % 2 == 0) remainder / 2 else remainder * 3 +1
            steps++
        }

        return steps
    }
}