import org.scalatest.{Matchers, FunSuite}

/** @version 2.3.0 */
class AllYourBaseTest extends FunSuite with Matchers {

  test("single bit one to decimal") {
    AllYourBase.rebase(2, List(1), 10) should be(Some(List(1)))
  }

  test("binary to single decimal") {
    AllYourBase.rebase(2, List(1, 0, 1), 10) should be(Some(List(5)))
  }

  test("single decimal to binary") {
    AllYourBase.rebase(10, List(5), 2) should be(Some(List(1, 0, 1)))
  }

  test("binary to multiple decimal") {
    AllYourBase.rebase(2, List(1, 0, 1, 0, 1, 0), 10) should be(
      Some(List(4, 2)))
  }

  test("decimal to binary") {
    AllYourBase.rebase(10, List(4, 2), 2) should be(
      Some(List(1, 0, 1, 0, 1, 0)))
  }

  test("trinary to hexadecimal") {
    AllYourBase.rebase(3, List(1, 1, 2, 0), 16) should be(Some(List(2, 10)))
  }

  test("hexadecimal to trinary") {
    AllYourBase.rebase(16, List(2, 10), 3) should be(Some(List(1, 1, 2, 0)))
  }

  test("15-bit integer") {
    AllYourBase.rebase(97, List(3, 46, 60), 73) should be(Some(List(6, 10, 45)))
  }

  test("empty list") {
    AllYourBase.rebase(2, List(), 10) should be(Some(List(0)))
  }

  test("single zero") {
    AllYourBase.rebase(10, List(0), 2) should be(Some(List(0)))
  }

  test("multiple zeros") {
    AllYourBase.rebase(10, List(0, 0, 0), 2) should be(Some(List(0)))
  }

  test("leading zeros") {
    AllYourBase.rebase(7, List(0, 6, 0), 10) should be(Some(List(4, 2)))
  }

  test("input base is one") {
    AllYourBase.rebase(1, List(0), 10) should be(None)
  }

  test("input base is zero") {
    AllYourBase.rebase(0, List(), 10) should be(None)
  }

  test("input base is negative") {
    AllYourBase.rebase(-2, List(1), 10) should be(None)
  }

  test("negative digit") {
    AllYourBase.rebase(2, List(1, -1, 1, 0, 1, 0), 10) should be(None)
  }

  test("invalid positive digit") {
    AllYourBase.rebase(2, List(1, 2, 1, 0, 1, 0), 10) should be(None)
  }

  test("output base is one") {
    AllYourBase.rebase(2, List(1, 0, 1, 0, 1, 0), 1) should be(None)
  }

  test("output base is zero") {
    AllYourBase.rebase(10, List(7), 0) should be(None)
  }

  test("output base is negative") {
    AllYourBase.rebase(2, List(1), -7) should be(None)
  }

  test("both bases are negative") {
    AllYourBase.rebase(-2, List(1), -7) should be(None)
  }
}
