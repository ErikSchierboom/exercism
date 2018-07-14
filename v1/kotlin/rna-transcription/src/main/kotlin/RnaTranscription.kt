object RnaTranscription {
    val dnaToRna = mapOf('C' to 'G', 'G' to 'C', 'T' to 'A', 'A' to 'U')

    fun ofDna(input: String): String = input.map { dnaToRna[it] }.joinToString(separator = "")
}
