class Anagram(input: String) {
    val input = input
    val normalizedInput = normalize(input)

    fun match(list: List<String>): List<String> = list.filter {
        normalize(it).equals(normalizedInput) && !it.toLowerCase().equals(input.toLowerCase())
    }

    private fun normalize(str: String): String = str.toLowerCase().toCharArray().sorted().joinToString(separator = "")
}