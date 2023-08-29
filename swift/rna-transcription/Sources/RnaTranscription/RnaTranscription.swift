func toRna(_ dna: String) -> String {
  String(dna.map(toComplement))
}

func toComplement(_ nucleotide: Character) -> Character {
  switch (nucleotide) {
    case "G": return "C"
    case "C": return "G"
    case "T": return "A"
    case "A": return "U"
    default: return nucleotide
  }
}
