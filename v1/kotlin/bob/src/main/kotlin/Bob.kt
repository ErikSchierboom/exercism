object Bob {
    fun hey(input: String): String =
            if (input.isNullOrBlank()) "Fine. Be that way!"
            else if (input.any { Character.isLetter(it) } && input.toUpperCase().equals(input)) "Whoa, chill out!"
            else if (input.endsWith('?')) "Sure."
            else "Whatever."
}