func rotate(_ plaintext: String, ROT rotateBy: Int) -> String {
    let lowerMap = rotateMap(of: "abcdefghijklmnopqrstuvwxyz", by: rotateBy)
    let upperMap = rotateMap(of: "ABCDEFGHIJKLMNOPQRSTUVWXYZ", by: rotateBy)
    let charMap = lowerMap.merging(upperMap) { (first, _) in first }
    
    return String(plaintext.map { char in charMap[char, default: char] })
}

func rotateMap(of input: String, by rotateBy: Int) -> [Character: Character] {
    let characters = Array(input)
    let rotatedCharacters = characters.rotate(by: rotateBy)
    
    return Dictionary(zip(characters, rotatedCharacters)) { (first, _) in first }
}

extension Array {
    func rotate(by offset: Int) -> [Element] {
        Array(self[offset...] + self[..<offset])
    }
}
