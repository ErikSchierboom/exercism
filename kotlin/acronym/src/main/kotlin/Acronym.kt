object Acronym {
    fun generate(phrase: String) = phrase
        .split("[^A-Za-z']+".toRegex())
        .map(String::first)
        .joinToString("")
        .uppercase()
}