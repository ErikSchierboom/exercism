func toLimit(_ number: Int, inMultiples: [Int]) -> Int {
    func isMultiple(candidate: Int) -> Bool { 
        inMultiples.contains { $0 > 0 && candidate % $0 == 0}
    }

    return (0..<number).filter(isMultiple).reduce(0, +);
}
