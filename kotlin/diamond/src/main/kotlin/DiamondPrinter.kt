class DiamondPrinter {
    private fun printLine(rowAndLetter: Pair<Int, Char>, letterCount: Int): String {
        val (row, letter) = rowAndLetter

        val outerSpaces = "".padEnd(letterCount - row - 1);
        val innerSpaces = "".padEnd(if (row == 0) 0 else row * 2 - 1);
¡
        return when (letter) {
            'A' -> "$outerSpaces$letter$outerSpaces"
            else -> "$outerSpaces$letter$innerSpaces$letter$outerSpaces"
        }
    }

    private fun letters(diamondLetter: Char): List<Pair<Int, Char>> {
        val topAndMiddleLetters = ('A' .. diamondLetter)
                .toList()
                .mapIndexed { i, c -> i to c }

        val bottomLetters = topAndMiddleLetters.reversed().drop(1)
        return topAndMiddleLetters + bottomLetters
    }

    fun printToList(diamondLetter: Char): List<String> {
        val letters = letters(diamondLetter)
        val letterCount = ('A' .. diamondLetter).count()
        return letters.map { printLine(it, letterCount) }
    }
}


