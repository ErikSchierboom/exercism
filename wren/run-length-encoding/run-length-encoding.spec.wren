import "./run-length-encoding" for RLE
import "wren-testie/testie" for Testie, Expect

Testie.test("run-length encode a string") { |do, skip|
  do.describe("run-length encode a string") {
    do.test("encode empty string") {
      Expect.value(RLE.encode("")).toEqual("")
    }

    do.test("single characters only are encoded without count") {
      Expect.value(RLE.encode("XYZ")).toEqual("XYZ")
    }

    do.test("encode string with no single characters") {
      Expect.value(RLE.encode("AABBBCCCC")).toEqual("2A3B4C")
    }

    do.test("encode string with single characters mixed with repeated characters") {
      Expect.value(
        RLE.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
      ).toEqual("12WB12W3B24WB")
    }

    do.test("encode string with multiple whitespaces") {
      Expect.value(RLE.encode("  hsqq qww  ")).toEqual("2 hs2q q2w2 ")
    }

    do.test("encode string with lowercase characters") {
      Expect.value(RLE.encode("aabbbcccc")).toEqual("2a3b4c")
    }
  }

  do.describe("run-length decode a string") {
    do.test("decode empty string") {
      Expect.value(RLE.decode("")).toEqual("")
    }

    do.test("decode string with single characters only") {
      Expect.value(RLE.decode("XYZ")).toEqual("XYZ")
    }

    do.test("decode string with no single characters") {
      Expect.value(RLE.decode("2A3B4C")).toEqual("AABBBCCCC")
    }

    do.test("decode string with single characters mixed with repeated characters") {
      Expect.value(RLE.decode("12WB12W3B24WB")).toEqual(
        "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
      )
    }

    do.test("decode string with multiple whitespaces") {
      Expect.value(RLE.decode("2 hs2q q2w2 ")).toEqual("  hsqq qww  ")
    }

    do.test("decode string with lowercase characters") {
      Expect.value(RLE.decode("2a3b4c")).toEqual("aabbbcccc")
    }
  }

  do.describe("run-length encode and then decode") {
    do.test("encode followed by decode gives original string") {
      Expect.value(RLE.decode(RLE.encode("zzz ZZ  zZ"))).toEqual("zzz ZZ  zZ")
    }
  }
}