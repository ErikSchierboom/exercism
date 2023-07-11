import org.scalatest.{Matchers, FunSuite}

/** @version 1.2.0 */
class TwoferTest extends FunSuite with Matchers {

  test("no name given") {
    Twofer.twofer() should be ("One for you, one for me.")
  }

  test("a name given") {
    Twofer.twofer("Alice") should be ("One for Alice, one for me.")
  }

  test("another name given") {
    Twofer.twofer("Bob") should be ("One for Bob, one for me.")
  }
}