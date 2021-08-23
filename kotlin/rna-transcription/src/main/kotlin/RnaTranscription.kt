private val dnaToRna = mapOf('C' to 'G', 'G' to 'C', 'T' to 'A', 'A' to 'U')

fun transcribeToRna(dna: String) = dna.map(dnaToRna::get).joinToString("")
