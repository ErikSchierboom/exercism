struct Series {
    let digits: [Int]

    init(_ input: String) { 
        digits = input.compactMap(\.wholeNumberValue)
    }
    
    func slices(_ size: Int) -> [[Int]] {
        guard size <= digits.count else { return [] }

        return (0...digits.count - size).map { idx in
            Array(digits[idx..<idx + size])
        }
    }
}
