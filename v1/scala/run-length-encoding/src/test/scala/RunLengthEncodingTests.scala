import org.scalatest.FunSuite
import org.scalatest.Matchers

class RunLengthEncodingTests extends FunSuite with Matchers {

  test("encode empty string") {
    RunLengthEncoding.encode("") should be ("")
  }

  test("encode single characters only") {
    RunLengthEncoding.encode("XYZ") should be ("XYZ")
  }

  test("decode empty string") {
    RunLengthEncoding.decode("") should be ("")
  }

  test("decode single characters only") {
    RunLengthEncoding.decode("XYZ") should be ("XYZ")
  }

  test("encode simple") {
    RunLengthEncoding.encode("AABBBCCCC") should be ("2A3B4C")
  }

  test("decode simple") {
    RunLengthEncoding.decode("2A3B4C") should be ("AABBBCCCC")
  }

  test("encode with single values") {
    RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") should
      be ("12WB12W3B24WB")
  }

  test("decode with single values") {
    RunLengthEncoding.decode("12WB12W3B24WB") should be ("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
  }

  test("decode(encode(...)) combination") {
    RunLengthEncoding.decode(
        RunLengthEncoding.encode("zzz ZZ  zZ")) should be ("zzz ZZ  zZ")
  }

}
