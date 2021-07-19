class Anagram(private val input: String) {
    private val normalizedInput = input.normalize()

    fun match(candidates: Set<String>): Set<String> =
        candidates.filter { !it.equals(input, ignoreCase = true) && it.normalize() == normalizedInput }.toSet()

    private fun String.normalize() = toLowerCase().asSequence().sorted().joinToString(separator = "")
}