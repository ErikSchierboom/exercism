import Foundation

class Anagram {
  let source: String
  let normalizedSource: [Character]

  init(word source: String) {
    self.source = source
    self.normalizedSource = Anagram.normalize(source)
  }

  func match(_ candidates: [String]) -> [String] {
    candidates.lazy
      .filter { self.source.caseInsensitiveCompare($0) != ComparisonResult.orderedSame }
      .filter { self.normalizedSource.elementsEqual(Anagram.normalize($0)) }
  }

  private static func normalize(_ str: String) -> [Character] {
    str.lowercased().sorted()
  }
}
