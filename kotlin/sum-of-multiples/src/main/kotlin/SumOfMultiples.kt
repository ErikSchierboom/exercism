object SumOfMultiples {
    fun sum(numbers: Set<Int>, max: Int) = (1 until max).filter { i -> numbers.any { i % it == 0 } }.sum()
}