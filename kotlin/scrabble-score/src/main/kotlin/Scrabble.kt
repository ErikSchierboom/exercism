object Scrabble {
    val letterScores =
        listOf(
            "AEIOULNRST" to 1,
            "DG" to 2,
            "BCMP" to 3,
            "FHVWY" to 4,
            "K" to 5,
            "JX" to 8,
            "QZ" to 10)
            .flatMap { it.first.map { letter -> letter to it.second } }
            .toMap()

    fun scoreWord(input: String): Int = input.toUpperCase().sumBy { letterScores.getOrElse(it) { 0 } }
}