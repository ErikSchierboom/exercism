import org.scalatest.{Matchers, FunSuite}

/** @version 1.2.0 */
class SecretHandshakeTest extends FunSuite with Matchers {

  test("wink for 1") {
    SecretHandshake.commands(1) should be (List("wink"))
  }

  test("double blink for 10") {
    SecretHandshake.commands(2) should be (List("double blink"))
  }

  test("close your eyes for 100") {
    SecretHandshake.commands(4) should be (List("close your eyes"))
  }

  test("jump for 1000") {
    SecretHandshake.commands(8) should be (List("jump"))
  }

  test("combine two actions") {
    SecretHandshake.commands(3) should be (List("wink", "double blink"))
  }

  test("reverse two actions") {
    SecretHandshake.commands(19) should be (List("double blink", "wink"))
  }

  test("reversing one action gives the same action") {
    SecretHandshake.commands(24) should be (List("jump"))
  }

  test("reversing no actions still gives no actions") {
    SecretHandshake.commands(16) should be (List())
  }

  test("all possible actions") {
    SecretHandshake.commands(15) should be (List("wink", "double blink", "close your eyes", "jump"))
  }

  test("reverse all possible actions") {
    SecretHandshake.commands(31) should be (List("jump", "close your eyes", "double blink", "wink"))
  }

  test("do nothing for zero") {
    SecretHandshake.commands(0) should be (List())
  }
}
