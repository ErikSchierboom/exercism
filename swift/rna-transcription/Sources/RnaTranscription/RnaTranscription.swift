let complements: [Character: Character] = ["G": "C", "C": "G", "T": "A", "A": "U"]

func toRna(_ dna: String) -> String {
  String(dna.map { complements[$0]! })
}
