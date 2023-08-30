let letterScores = [
    "AEIOULNRST": 1, 
    "DG": 2,
    "BCMP": 3,
    "FHVWY": 4,
    "K": 5,
    "JX": 8,
    "QZ": 10
  ].reduce(into: [Character: Int]()) { result, entry in
    entry.key.forEach { letter in result[letter] = entry.value }
}

func score(_ phrase: String) -> Int {
  phrase.uppercased().reduce(0) { sum, letter in sum + letterScores[letter]! }
}
