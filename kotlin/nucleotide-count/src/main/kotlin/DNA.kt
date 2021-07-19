const val NUCLEOTIDES = "ACGT"

class Dna(strand: String) {
    init {
        require(strand.all { it in NUCLEOTIDES } )
    }

    val nucleotideCounts = NUCLEOTIDES.associateWith { n -> strand.count { it == n } }
}