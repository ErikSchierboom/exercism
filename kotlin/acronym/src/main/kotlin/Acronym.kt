object Acronym {
    fun generate(phrase: String) = phrase.parts().map { it.acronymLetter() }.joinToString("")

    private fun String.parts() = "[A-Z]+[a-z']*|[a-z]+".toRegex().findAll(this).map { it.value }
    private fun String.acronymLetter() = this[0].uppercase()
}