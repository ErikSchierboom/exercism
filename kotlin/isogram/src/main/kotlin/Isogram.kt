object Isogram {
    fun isIsogram(input: String): Boolean {
        val letters = input
                .toLowerCase()
                .toCharArray()
                .filter(Character::isLetter)

        return letters.distinct().count() == letters.count()
    }
}