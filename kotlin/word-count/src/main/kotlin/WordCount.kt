object WordCount {
    fun phrase(input: String): Map<String, Int> {
        return input.toLowerCase()
                .filter { Character.isLetterOrDigit(it) || it == ' ' || it == '\'' }
                .split(Regex("\\s+"))
                .groupBy { it }
                .map { it.key to it.value.size }
                .toMap()
    }
}