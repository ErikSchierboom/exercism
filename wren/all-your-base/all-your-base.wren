class AllYourBase {
  static rebase(inputBase, digits, outputBase) {
    if (inputBase < 2) Fiber.abort("input base must be >= 2")
    if (outputBase < 2) Fiber.abort("output base must be >= 2")

    var decimal = 0

    for (digit in digits) {
        if (digit < 0 || digit >= inputBase) Fiber.abort("all digits must satisfy 0 <= d < input base")
        decimal = decimal * inputBase + digit
    }

    if (decimal == 0) return [0]

    var outputDigits = []

    while (decimal > 0) {
        outputDigits.insert(0, decimal % outputBase)
        decimal = (decimal / outputBase).truncate
    }

    return outputDigits
  }
}
