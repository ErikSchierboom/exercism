import org.scalatest.{Matchers, FunSuite}

/** @version 1.1.0 */
class GrainsTest extends FunSuite with Matchers {

  test("1") {
    Grains.square(1) should be(Some(1))
  }

  test("2") {
    Grains.square(2) should be(Some(2))
  }

  test("3") {
    Grains.square(3) should be(Some(4))
  }

  test("4") {
    Grains.square(4) should be(Some(8))
  }

  test("16") {
    Grains.square(16) should be(Some(32768))
  }

  test("32") {
    Grains.square(32) should be(Some(BigInt("2147483648")))
  }

  test("64") {
    Grains.square(64) should be(Some(BigInt("9223372036854775808")))
  }

  test("square 0 raises an exception") {
    Grains.square(0) should be(None)
  }

  test("negative square raises an exception") {
    Grains.square(-1) should be(None)
  }

  test("square greater than 64 raises an exception") {
    Grains.square(65) should be(None)
  }

  test("returns the total number of grains on the board") {
    Grains.total should be(BigInt("18446744073709551615"))
  }
}
