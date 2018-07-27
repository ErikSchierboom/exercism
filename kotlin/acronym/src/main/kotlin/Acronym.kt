object Acronym {
    fun acronymChar(word: String) = word[0].toUpperCase()

    fun generate(phrase: String): String =
        Regex("[A-Z]+[a-z]*|[a-z]+")
             .findAll(phrase)
             .map { acronymChar(it.value) }
             .joinToString(separator = "")
}