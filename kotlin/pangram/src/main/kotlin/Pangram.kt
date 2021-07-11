object Pangram {
    fun isPangram(input: String) = ('a'..'z').all { input.contains(it, ignoreCase = true) }
}

