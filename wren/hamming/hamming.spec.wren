import "./hamming" for Hamming
import "wren-testie/testie" for Testie, Expect

Testie.test("Hamming") { |do, skip|
  do.test("empty strands") {
    Expect.value(Hamming.compute("", "")).toEqual(0)
  }

  do.test("single letter identical strands") {
    Expect.value(Hamming.compute("A", "A")).toEqual(0)
  }

  do.test("single letter different strands") {
    Expect.value(Hamming.compute("G", "T")).toEqual(1)
  }

  do.test("long identical strands") {
    Expect.value(Hamming.compute("GGACTGAAATCTG", "GGACTGAAATCTG")).toEqual(0)
  }

  do.test("long different strands") {
    Expect.value(Hamming.compute("GGACGGATTCTG", "AGGACGGATTCT")).toEqual(9)
  }

  do.test("disallow first strand longer") {
    Expect.that {
      Hamming.compute("AATG", "AAA")
    }.abortsWith("strands must be of equal length")
  }

  do.test("disallow second strand longer") {
    Expect.that {
      Hamming.compute("ATA", "AGTG")
    }.abortsWith("strands must be of equal length")
  }

  do.test("disallow left empty strand") {
    Expect.that {
      Hamming.compute("", "G")
    }.abortsWith("strands must be of equal length")
  }

  do.test("disallow right empty strand") {
    Expect.that {
      Hamming.compute("G", "")
    }.abortsWith("strands must be of equal length")
  }
}
