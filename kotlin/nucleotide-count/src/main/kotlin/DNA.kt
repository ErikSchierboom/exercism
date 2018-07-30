class Dna(strand: String) {
    val nucleotideCounts: Map<Char, Int>

    init {
        require(strand.all { it in "ACGT" } )
        nucleotideCounts = "ACGT".map { nucleotide -> nucleotide to strand.count { it == nucleotide } }.toMap()
    }
}