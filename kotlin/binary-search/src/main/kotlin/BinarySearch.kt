object BinarySearch {
    fun search(input: List<Int>, value: Int): Int = binarySearch(input, value,0, input.size - 1)

    private tailrec fun binarySearch(input: List<Int>, value: Int, lower: Int, upper: Int): Int {
        val middleIndex = upper + lower / 2

        return when {
            lower > upper -> -1
            input[middleIndex] == value -> middleIndex
            input[middleIndex] < value -> binarySearch(input, value, middleIndex + 1, upper)
            else -> binarySearch(input, value, lower, middleIndex - 1)
        }
    }
}