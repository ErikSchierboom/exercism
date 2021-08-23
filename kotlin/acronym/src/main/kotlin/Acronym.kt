object Acronym {
    fun generate(phrase: String) = phrase.parts().joinToString("") { it[0].uppercase() }

    private fun String.parts() = "[A-Z]+[a-z']*|[a-z]+".toRegex().findAll(this).map { it.value }
}