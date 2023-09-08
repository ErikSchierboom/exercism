func isIsogram(_ string: String) -> Bool {
  var letters = Set<String>()

  return string.lazy.filter { $0.isLetter }
    .map { $0.lowercased() }
    .allSatisfy { letters.insert($0).inserted }
}
