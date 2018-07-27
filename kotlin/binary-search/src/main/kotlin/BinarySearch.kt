object BinarySearch {
    tailrec fun search(input: List<Int>, value: Int): Int {
        if (input.sorted() != input)
            throw IllegalArgumentException()

        if (input.isEmpty())
            return -1

        val middleIndex = input.size / 2
        val middle = input[middleIndex]

        if (middle == value)
            return middleIndex
        else if (middle < value)
            return search(input.subList(middleIndex + 1, input.size - 1), value)
        else
            return search(input.subList(0, middleIndex), value)
    }

}