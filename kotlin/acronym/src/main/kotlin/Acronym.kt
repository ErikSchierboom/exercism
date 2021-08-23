object Acronym {
    fun generate(phrase: String) = phrase.parts().joinToString("") { it.acronymLetter() }

    private fun String.parts() = "[A-Z]+[a-z']*|[a-z]+".toRegex().findAll(this).map { it.value }
    private fun String.acronymLetter() = this[0].uppercase()
}