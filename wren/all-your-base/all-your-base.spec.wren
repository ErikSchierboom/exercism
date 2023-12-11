import "./all-your-base" for AllYourBase
import "wren-testie/testie" for Testie, Expect

Testie.test("AllYourBase.rebase()") { |do, skip|
  do.test("single bit one to decimal") {
    Expect.value(AllYourBase.rebase(2, [1], 10)).toEqual([1])
  }

  do.test("binary to single decimal") {
    Expect.value(AllYourBase.rebase(2, [1, 0, 1], 10)).toEqual([5])
  }

  do.test("single decimal to binary") {
    Expect.value(AllYourBase.rebase(10, [5], 2)).toEqual([1, 0, 1])
  }

  do.test("binary to multiple decimal") {
    Expect.value(AllYourBase.rebase(2, [1, 0, 1, 0, 1, 0], 10)).toEqual([4, 2])
  }

  do.test("decimal to binary") {
    Expect.value(AllYourBase.rebase(10, [4, 2], 2)).toEqual([1, 0, 1, 0, 1, 0])
  }

  do.test("trinary to hexadecimal") {
    Expect.value(AllYourBase.rebase(3, [1, 1, 2, 0], 16)).toEqual([2, 10])
  }

  do.test("hexadecimal to trinary") {
    Expect.value(AllYourBase.rebase(16, [2, 10], 3)).toEqual([1, 1, 2, 0])
  }

  do.test("15-bit integer") {
    Expect.value(AllYourBase.rebase(97, [3, 46, 60], 73)).toEqual([6, 10, 45])
  }

  do.test("empty list") {
    Expect.value(AllYourBase.rebase(2, [], 10)).toEqual([0])
  }

  do.test("single zero") {
    Expect.value(AllYourBase.rebase(10, [0], 2)).toEqual([0])
  }

  do.test("multiple zeros") {
    Expect.value(AllYourBase.rebase(10, [0, 0, 0], 2)).toEqual([0])
  }

  do.test("leading zeros") {
    Expect.value(AllYourBase.rebase(7, [0, 6, 0], 10)).toEqual([4, 2])
  }

  Expect.that {
    AllYourBase.rebase(1, [0], 10)
  }.abortsWith("input base must be >= 2")

  Expect.that {
    AllYourBase.rebase(0, [], 10)
  }.abortsWith("input base must be >= 2")

  Expect.that {
    AllYourBase.rebase(-2, [1], 10)
  }.abortsWith("input base must be >= 2")

  Expect.that {
    AllYourBase.rebase(2, [1, -1, 1, 0, 1, 0], 10)
  }.abortsWith("all digits must satisfy 0 <= d < input base")

  Expect.that {
    AllYourBase.rebase(2, [1, 2, 1, 0, 1, 0], 10)
  }.abortsWith("all digits must satisfy 0 <= d < input base")

  Expect.that {
    AllYourBase.rebase(2, [1, 0, 1, 0, 1, 0], 1)
  }.abortsWith("output base must be >= 2")

  Expect.that {
    AllYourBase.rebase(10, [7], 0)
  }.abortsWith("output base must be >= 2")

  Expect.that {
    AllYourBase.rebase(2, [1], -7)
  }.abortsWith("output base must be >= 2")

  Expect.that {
    AllYourBase.rebase(-2, [1], -7)
  }.abortsWith("input base must be >= 2")
}
