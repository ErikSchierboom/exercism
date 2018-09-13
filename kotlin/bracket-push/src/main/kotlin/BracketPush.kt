object BracketPush {
    private val closingToOpeningBrackets = mapOf(']' to '[', '}' to '{', ')' to '(')

    private fun isOpeningBracket(character: Char) = character in closingToOpeningBrackets.values

    private fun isClosingBracket(character: Char) = character in closingToOpeningBrackets.keys

    fun isValid(input: String): Boolean {
        val unpairedOpeningBrackets = mutableListOf<Char>()

        for (character in input) {
            when {
                isOpeningBracket(character) -> unpairedOpeningBrackets.add(character)
                isClosingBracket(character) -> {
                    val expectedOpeningBracket = closingToOpeningBrackets[character]
                    val actualOpeningBracket = unpairedOpeningBrackets.lastOrNull()

                    if(expectedOpeningBracket == actualOpeningBracket)
                        unpairedOpeningBrackets.removeAt(unpairedOpeningBrackets.lastIndex)
                    else
                        return false
                }
            }
        }

        return unpairedOpeningBrackets.isEmpty()
    }
}