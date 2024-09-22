class Hamming {
  static compute(first, second) {
    if (first.count != second.count) Fiber.abort("strands must be of equal length")

    var distance = 0

    for (i in 0...first.count) {
      if (first[i] != second[i]) {
        distance = distance + 1
      }
    }

    return distance
  }
}
