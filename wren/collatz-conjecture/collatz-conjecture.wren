class Collatz {
  static steps(n) {
    if (n < 1) { Fiber.abort("Only positive numbers are allowed") }

    var numSteps = 0

    while (n != 1) {
      n = n % 2 == 0 ? n / 2 : n * 3 + 1
      numSteps = numSteps + 1
    }

    return numSteps
  }
}
