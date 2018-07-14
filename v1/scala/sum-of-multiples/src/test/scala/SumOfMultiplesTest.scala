import org.scalatest.{FunSuite, Matchers}

class SumOfMultiplesTest extends FunSuite with Matchers {
  test("[3, 5] 1") {
    SumOfMultiples.sumOfMultiples(List(3, 5), 1) should be (0)
  }

  test("[3, 5] 4") {
    SumOfMultiples.sumOfMultiples(List(3, 5), 4) should be (3)
  }

  test("[3, 5] 10") {
    SumOfMultiples.sumOfMultiples(List(3, 5), 10) should be (23)
  }

  test("[3, 5] 100") {
    SumOfMultiples.sumOfMultiples(List(3, 5), 100) should be (2318)
  }

  test("[3, 5] 1000") {
    SumOfMultiples.sumOfMultiples(List(3, 5), 1000) should be (233168)
  }

  test("[7, 13, 17] 20") {
    SumOfMultiples.sumOfMultiples(List(7, 13, 17), 20) should be (51)
  }

  test("[4, 6] 15") {
    SumOfMultiples.sumOfMultiples(List(4, 6), 15) should be (30)
  }

  test("[5, 6, 8] 150") {
    SumOfMultiples.sumOfMultiples(List(5, 6, 8), 150) should be (4419)
  }

  test("[5, 25] 51") {
    SumOfMultiples.sumOfMultiples(List(5, 25), 51) should be (275)
  }

  test("[43, 47] 10000") {
    SumOfMultiples.sumOfMultiples(List(43, 47), 10000) should be (2203160)
  }

  test("[1] 100") {
    SumOfMultiples.sumOfMultiples(List(1), 100) should be (4950)
  }

  test("[] 10000") {
    SumOfMultiples.sumOfMultiples(List(), 10000) should be (0)
  }
}
