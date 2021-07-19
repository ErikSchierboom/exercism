object WordCount {
    fun phrase(input: String) = input.toLowerCase().words().groupingBy { it }.eachCount()

    private fun String.words() = Regex("""\w+('?\w)*""").findAll(this).map { it.value }
}