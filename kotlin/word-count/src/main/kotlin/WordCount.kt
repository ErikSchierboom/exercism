object WordCount {
    fun phrase(input: String): Map<String, Int> {
        return input.toLowerCase()
                .filter { Character.isLetterOrDigit(it) || it == ' ' || it == '\'' }
                .split(Regex(" +"))
                .groupBy { it }
                .map { Pair(it.key, it.value.size )}
                .toMap()
    }
}
