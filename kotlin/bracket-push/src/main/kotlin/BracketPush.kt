object BracketPush {
    fun isValid(input: String): Boolean {
        val openDelimiters = mutableListOf<Char>()

        for (character in input) {
            when {
                character.isOpenDelimiter() -> openDelimiters.add(character)
                character.isCloseDelimiter() -> {
                    val expectedOpenDelimiter = closeToOpenDelimiters[character]
                    val actualOpenDelimiter = openDelimiters.lastOrNull()

                    if (expectedOpenDelimiter == actualOpenDelimiter)
                        openDelimiters.removeAt(openDelimiters.lastIndex)
                    else
                        return false
                }
            }
        }

        return openDelimiters.isEmpty()
    }

    private val closeToOpenDelimiters = mapOf(']' to '[', '}' to '{', ')' to '(')

    private fun Char.isOpenDelimiter() = this in closeToOpenDelimiters.values
    private fun Char.isCloseDelimiter() = this in closeToOpenDelimiters.keys
}