object Isogram {
    fun isIsogram(input: String): Boolean {
        val letters = getLetters(input)

        return letters.toSet().size == letters.length
    }

    private fun getLetters(input: String): String =
            input.toLowerCase()
                    .toCharArray()
                    .filter { Character.isLetter(it) }
                    .joinToString(separator = "")
}