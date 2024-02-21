object Acronym {
    fun generate(phrase: String) =
        Regex("[A-Za-z']+")
            .findAll(phrase)
            .joinToString("") { it.value.take(1) }
            .toUpperCase()
}