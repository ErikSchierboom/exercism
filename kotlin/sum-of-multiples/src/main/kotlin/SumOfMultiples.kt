object SumOfMultiples {
    fun sum(numbers: Set<Int>, max: Int) =
        1.until(max).filter { i -> numbers.any { it != 0 && i % it == 0 } }.sum()
}