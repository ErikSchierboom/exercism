class DNA(strand: String) {
    val validNucleotides = "ACGT"
    val nucleotideCounts: Map<Char, Int>

    init {
        if (strand.any { it !in validNucleotides })
            throw IllegalArgumentException()

        nucleotideCounts = "ACGT".map { it to strand.count { n -> n == it } }.toMap()
    }

    fun count(nucleotide: Char): Int {
        if (nucleotide !in validNucleotides)
            throw IllegalArgumentException()

        return nucleotideCounts.getOrElse(nucleotide) { 0 }
    }
}