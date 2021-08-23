object Bob {
    fun hey(response: String) = when {
        response.isBlank() -> "Fine. Be that way!"
        response.isYell() && response.isQuestion() -> "Calm down, I know what I'm doing!"
        response.isYell() -> "Whoa, chill out!"
        response.isQuestion() -> "Sure."
        else -> "Whatever."
    }

    private fun String.isQuestion() = trimEnd().endsWith('?')

    private fun String.isYell() = any(Char::isLetter) && uppercase() == this
}