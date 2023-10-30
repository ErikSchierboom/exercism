import "./collatz-conjecture" for Collatz
import "wren-testie/testie" for Testie, Expect

Testie.test("Collatz.steps()") { |do, skip|
  do.test("zero steps for one") {
    Expect.value(Collatz.steps(1)).toEqual(0)
  }

  do.test("divide if even") {
    Expect.value(Collatz.steps(16)).toEqual(4)
  }

  do.test("even and odd steps") {
    Expect.value(Collatz.steps(12)).toEqual(9)
  }

  do.test("large number of even and odd steps") {
    Expect.value(Collatz.steps(1000000)).toEqual(152)
  }

  do.test("zero is an error") {
    Expect.that {
      Collatz.steps(0)
    }.abortsWith("Only positive numbers are allowed")
  }

  do.test("negative value is an error") {
    Expect.that {
      Collatz.steps(-15)
    }.abortsWith("Only positive numbers are allowed")
  }
}
