import org.scalatest.{Matchers, FunSuite}

/** @version 1.1.0 */
class SublistTest extends FunSuite with Matchers {

  test("empty lists") {
    Sublist.sublist(List(), List()) should be(Sublist.Equal)
  }

  test("empty list within non empty list") {
    Sublist.sublist(List(), List(1, 2, 3)) should be(Sublist.Sublist)
  }

  test("non empty list contains empty list") {
    Sublist.sublist(List(1, 2, 3), List()) should be(Sublist.Superlist)
  }

  test("list equals itself") {
    Sublist.sublist(List(1, 2, 3), List(1, 2, 3)) should be(Sublist.Equal)
  }

  test("different lists") {
    Sublist.sublist(List(1, 2, 3), List(2, 3, 4)) should be(Sublist.Unequal)
  }

  test("false start") {
    Sublist.sublist(List(1, 2, 5), List(0, 1, 2, 3, 1, 2, 5, 6)) should be(
      Sublist.Sublist)
  }

  test("consecutive") {
    Sublist.sublist(List(1, 1, 2), List(0, 1, 1, 1, 2, 1, 2)) should be(
      Sublist.Sublist)
  }

  test("sublist at start") {
    Sublist.sublist(List(0, 1, 2), List(0, 1, 2, 3, 4, 5)) should be(
      Sublist.Sublist)
  }

  test("sublist in middle") {
    Sublist.sublist(List(2, 3, 4), List(0, 1, 2, 3, 4, 5)) should be(
      Sublist.Sublist)
  }

  test("sublist at end") {
    Sublist.sublist(List(3, 4, 5), List(0, 1, 2, 3, 4, 5)) should be(
      Sublist.Sublist)
  }

  test("at start of superlist") {
    Sublist.sublist(List(0, 1, 2, 3, 4, 5), List(0, 1, 2)) should be(
      Sublist.Superlist)
  }

  test("in middle of superlist") {
    Sublist.sublist(List(0, 1, 2, 3, 4, 5), List(2, 3)) should be(
      Sublist.Superlist)
  }

  test("at end of superlist") {
    Sublist.sublist(List(0, 1, 2, 3, 4, 5), List(3, 4, 5)) should be(
      Sublist.Superlist)
  }

  test("first list missing element from second list") {
    Sublist.sublist(List(1, 3), List(1, 2, 3)) should be(Sublist.Unequal)
  }

  test("second list missing element from first list") {
    Sublist.sublist(List(1, 2, 3), List(1, 3)) should be(Sublist.Unequal)
  }

  test("order matters to a list") {
    Sublist.sublist(List(1, 2, 3), List(3, 2, 1)) should be(Sublist.Unequal)
  }

  test("same digits but different numbers") {
    Sublist.sublist(List(1, 0, 1), List(10, 1)) should be(Sublist.Unequal)
  }
}
