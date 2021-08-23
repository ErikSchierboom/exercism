object WordCount {
    fun phrase(input: String) = input.lowercase().words().groupingBy { it }.eachCount()

    private fun String.words() = Regex("""\w+('?\w)*""").findAll(this).map { it.value }
}