object Pangrams {
    fun isPangram(input: String): Boolean {
        val normalized = input.toLowerCase()

        return ('a'..'z').all { it in normalized }
    }
}