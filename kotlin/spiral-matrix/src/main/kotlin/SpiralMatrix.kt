object SpiralMatrix {
    fun ofSize(size: Int): Array<IntArray> {
        val matrix = Array(size) { IntArray(size) { 0 } }

        var rowOffset = 0
        var columnOffset = 0

        val totalNumbers = size * size
        var currentNumber = 1

        while (currentNumber <= totalNumbers) {
            (columnOffset until size - columnOffset).forEach {
                matrix.get(rowOffset).set(it, currentNumber++)
            }

            (rowOffset + 1 until size - rowOffset).forEach {
                matrix.get(it).set(size - columnOffset - 1, currentNumber++)
            }

            (size - columnOffset - 2 downTo columnOffset).forEach {
                matrix.get(size - rowOffset - 1).set(it, currentNumber++)
            }

            (size - rowOffset - 2 downTo rowOffset + 1).forEach {
                matrix.get(it).set(columnOffset, currentNumber++)
            }

            rowOffset += 1
            columnOffset += 1
        }

        return matrix
    }
}