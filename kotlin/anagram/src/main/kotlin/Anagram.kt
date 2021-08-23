class Anagram(private val target: String) {
    fun match(candidates: Set<String>) = candidates.filter { it.anagramOf(target) }.toSet()

    private fun String.anagramOf(other: String) = sortedLowerCase() == other.sortedLowerCase() && notEqualTo(other)
    private fun String.sortedLowerCase() = lowercase().asIterable().sorted()
    private fun String.notEqualTo(other: String) = !equals(other, ignoreCase = true)
}