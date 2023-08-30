class Triangle {
  private var sides: [Float]

  init(_ sides: [Float]) {
    self.sides = sides
  }

  convenience init(_ sides: [Int]) {
    self.init(sides.map { Float($0) })
  }

  var isEquilateral: Bool {
    return valid && uniqueSides == 1
  }

  var isIsosceles: Bool {
    return valid && uniqueSides <= 2
  }

  var isScalene: Bool {
    return valid && uniqueSides == 3
  }

  private var valid: Bool {
    sides != [0.0, 0.0, 0.0] &&
    sides[0] + sides[1] >= sides [2] &&
    sides[1] + sides[2] >= sides [0] &&
    sides[0] + sides[2] >= sides [1]
  }

  private var uniqueSides: Int {
    Set<Float>(sides).count
  }
}
