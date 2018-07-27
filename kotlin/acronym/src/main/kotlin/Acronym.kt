object Acronym {
    fun generate(phrase: String): String =
        phrase.split(Regex("""[^\w]+""")).map { it[0].toUpperCase() }.joinToString("")
}