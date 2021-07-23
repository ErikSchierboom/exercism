object ScrabbleScore {
    private fun scoreLetter(letter: Char) = when (letter.uppercaseChar()) {
        'Q', 'Z' -> 10
        'J', 'X' -> 8
        'K' -> 5
        'F', 'H', 'V', 'W', 'Y' -> 4
        'B', 'C', 'M', 'P' -> 3
        'D', 'G' -> 2
        else -> 1
    }

    fun scoreWord(word: String) = word.sumOf(::scoreLetter)
}