object Isogram {
    fun isIsogram(input: String): Boolean {
        val letters = input.lowercase().filter(Char::isLetter)
        return letters.toSet().count() == letters.count()
    }
}