object WordCount {
    fun phrase(input: String): Map<String, Int> {
        return input.toLowerCase()
                .words()
                .groupingBy { it }
                .eachCount()
    }

    private fun String.words() = Regex("""[\w']+""").findAll(this).map { it.value.unquote() }

    private fun String.unquote() = this.trim('\'')
}