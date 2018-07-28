object Bob {
    fun hey(input: String): String = when {
        input.isBlank() -> "Fine. Be that way!"
        input.isYell() -> "Whoa, chill out!"
        input.isQuestion() -> "Sure."
        else -> "Whatever."
    }

    private fun String.isQuestion() = this.trimEnd().endsWith('?')

    private fun String.isYell() = this.any(Char::isLetter) && this.toUpperCase() == this
}