import org.scalatest.{FunSuite, Matchers}
import Sgf._

/** @version created manually **/
class SgfTest extends FunSuite with Matchers {
  test("parse \"\"") {
    Sgf.parseSgf("") should be (None)
  }

  test("parse \"()\"") {
    Sgf.parseSgf("()") should be (None)
  }

  test("parse \";\"") {
    Sgf.parseSgf(";") should be (None)
  }

  test("parse \"(;)\"") {
    Sgf.parseSgf("(;)") should be (Some(Node(Map())))
  }

  test("parse \"(;A[B])\"") {
    Sgf.parseSgf("(;A[B])") should be (Some(Node(Map("A" -> List("B")))))
  }

  test("parse \"(;a)\"") {
    Sgf.parseSgf("(;a)") should be (None)
  }

  test("parse \"(;a[b])\"") {
    Sgf.parseSgf("(;a[b])") should be (None)
  }

  test("parse \"(;Aa[b])\"") {
    Sgf.parseSgf("(;Aa[b])") should be (None)
  }

  test("parse \"(;A[B];B[C])\"") {
    Sgf.parseSgf("(;A[B];B[C])") should be (
        Some(Node(Map("A" -> List("B")), List(Node(Map("B" -> List("C")))))))
  }

  test("parse \"(;A[B](;B[C])(;C[D]))\"") {
    Sgf.parseSgf("(;A[B](;B[C])(;C[D]))") should be (
        Some(Node(Map("A" -> List("B")), List(Node(Map("B" -> List("C"))),
                                              Node(Map("C" -> List("D")))))))
  }

  test("parse \"(;A[b][c][d])\"") {
    Sgf.parseSgf("(;A[b][c][d])") should be (Some(Node(Map("A" -> List("b", "c", "d")))))
  }

  test("""parse "(;A[\\]b\nc\\\nd\t\te\\\\ \\\n\\]])"""") {
    Sgf.parseSgf("(;A[\\]b\nc\\\nd\t\te\\\\ \\\n\\]])") should be (
        Some(Node(Map("A" -> List("]b cd  e\\ ]")))))
  }
}
