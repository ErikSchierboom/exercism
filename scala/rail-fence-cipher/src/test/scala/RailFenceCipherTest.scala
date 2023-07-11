import org.scalatest.{Matchers, FunSuite}

/** @version 1.1.0 */
class RailFenceCipherTest extends FunSuite with Matchers {

  test("encode with two rails") {
    RailFenceCipher.encode("XOXOXOXOXOXOXOXOXO", 2) should be(
      "XXXXXXXXXOOOOOOOOO")
  }

  test("encode with three rails") {
    RailFenceCipher.encode("WEAREDISCOVEREDFLEEATONCE", 3) should be(
      "WECRLTEERDSOEEFEAOCAIVDEN")
  }

  test("encode with ending in the middle") {
    RailFenceCipher.encode("EXERCISES", 4) should be("ESXIEECSR")
  }

  test("decode with three rails") {
    RailFenceCipher.decode("TEITELHDVLSNHDTISEIIEA", 3) should be(
      "THEDEVILISINTHEDETAILS")
  }

  test("decode with five rails") {
    RailFenceCipher.decode("EIEXMSMESAORIWSCE", 5) should be(
      "EXERCISMISAWESOME")
  }

  test("decode with six rails") {
    RailFenceCipher.decode(
      "133714114238148966225439541018335470986172518171757571896261",
      6) should be(
      "112358132134558914423337761098715972584418167651094617711286")
  }
}
