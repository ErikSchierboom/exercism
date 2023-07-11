import org.scalatest.{Matchers, FunSuite}

/** @version 1.1.0 */
class ScrabbleScoreTest extends FunSuite with Matchers {

  test("lowercase letter") {
    ScrabbleScore.score("a") should be(1)
  }

  test("uppercase letter") {
    ScrabbleScore.score("A") should be(1)
  }

  test("valuable letter") {
    ScrabbleScore.score("f") should be(4)
  }

  test("short word") {
    ScrabbleScore.score("at") should be(2)
  }

  test("short, valuable word") {
    ScrabbleScore.score("zoo") should be(12)
  }

  test("medium word") {
    ScrabbleScore.score("street") should be(6)
  }

  test("medium, valuable word") {
    ScrabbleScore.score("quirky") should be(22)
  }

  test("long, mixed-case word") {
    ScrabbleScore.score("OxyphenButazone") should be(41)
  }

  test("english-like word") {
    ScrabbleScore.score("pinata") should be(8)
  }

  test("empty input") {
    ScrabbleScore.score("") should be(0)
  }

  test("entire alphabet available") {
    ScrabbleScore.score("abcdefghijklmnopqrstuvwxyz") should be(87)
  }
}
