import org.scalatest.{Matchers, FunSuite}

/** @version 2.2.1 */
class ClockTest extends FunSuite with Matchers {

  test("on the hour") {
    Clock(8, 0) should be(Clock(8, 0))
  }

  test("past the hour") {
    Clock(11, 9) should be(Clock(11, 9))
  }

  test("midnight is zero hours") {
    Clock(24, 0) should be(Clock(0, 0))
  }

  test("hour rolls over") {
    Clock(25, 0) should be(Clock(1, 0))
  }

  test("hour rolls over continuously") {
    Clock(100, 0) should be(Clock(4, 0))
  }

  test("sixty minutes is next hour") {
    Clock(1, 60) should be(Clock(2, 0))
  }

  test("minutes roll over") {
    Clock(0, 160) should be(Clock(2, 40))
  }

  test("minutes roll over continuously") {
    Clock(0, 1723) should be(Clock(4, 43))
  }

  test("hour and minutes roll over") {
    Clock(25, 160) should be(Clock(3, 40))
  }

  test("hour and minutes roll over continuously") {
    Clock(201, 3001) should be(Clock(11, 1))
  }

  test("hour and minutes roll over to exactly midnight") {
    Clock(72, 8640) should be(Clock(0, 0))
  }

  test("negative hour") {
    Clock(-1, 15) should be(Clock(23, 15))
  }

  test("negative hour rolls over") {
    Clock(-25, 0) should be(Clock(23, 0))
  }

  test("negative hour rolls over continuously") {
    Clock(-91, 0) should be(Clock(5, 0))
  }

  test("negative minutes") {
    Clock(1, -40) should be(Clock(0, 20))
  }

  test("negative minutes roll over") {
    Clock(1, -160) should be(Clock(22, 20))
  }

  test("negative minutes roll over continuously") {
    Clock(1, -4820) should be(Clock(16, 40))
  }

  test("negative hour and minutes both roll over") {
    Clock(-25, -160) should be(Clock(20, 20))
  }

  test("negative hour and minutes both roll over continuously") {
    Clock(-121, -5810) should be(Clock(22, 10))
  }

  test("add minutes") {
    Clock(10, 0) + Clock(3) should be(Clock(10, 3))
  }

  test("add no minutes") {
    Clock(6, 41) + Clock(0) should be(Clock(6, 41))
  }

  test("add to next hour") {
    Clock(0, 45) + Clock(40) should be(Clock(1, 25))
  }

  test("add more than one hour") {
    Clock(10, 0) + Clock(61) should be(Clock(11, 1))
  }

  test("add more than two hours with carry") {
    Clock(0, 45) + Clock(160) should be(Clock(3, 25))
  }

  test("add across midnight") {
    Clock(23, 59) + Clock(2) should be(Clock(0, 1))
  }

  test("add more than one day (1500 min = 25 hrs)") {
    Clock(5, 32) + Clock(1500) should be(Clock(6, 32))
  }

  test("add more than two days") {
    Clock(1, 1) + Clock(3500) should be(Clock(11, 21))
  }

  test("subtract minutes") {
    Clock(10, 3) - Clock(3) should be(Clock(10, 0))
  }

  test("subtract to previous hour") {
    Clock(10, 3) - Clock(30) should be(Clock(9, 33))
  }

  test("subtract more than an hour") {
    Clock(10, 3) - Clock(70) should be(Clock(8, 53))
  }

  test("subtract across midnight") {
    Clock(0, 3) - Clock(4) should be(Clock(23, 59))
  }

  test("subtract more than two hours") {
    Clock(0, 0) - Clock(160) should be(Clock(21, 20))
  }

  test("subtract more than two hours with borrow") {
    Clock(6, 15) - Clock(160) should be(Clock(3, 35))
  }

  test("subtract more than one day (1500 min = 25 hrs)") {
    Clock(5, 32) - Clock(1500) should be(Clock(4, 32))
  }

  test("subtract more than two days") {
    Clock(2, 20) - Clock(3000) should be(Clock(0, 20))
  }

  test("clocks with same time") {
    Clock(15, 37) == Clock(15, 37) should be(true)
  }

  test("clocks a minute apart") {
    Clock(15, 36) == Clock(15, 37) should be(false)
  }

  test("clocks an hour apart") {
    Clock(14, 37) == Clock(15, 37) should be(false)
  }

  test("clocks with hour overflow") {
    Clock(10, 37) == Clock(34, 37) should be(true)
  }

  test("clocks with hour overflow by several days") {
    Clock(3, 11) == Clock(99, 11) should be(true)
  }

  test("clocks with negative hour") {
    Clock(22, 40) == Clock(-2, 40) should be(true)
  }

  test("clocks with negative hour that wraps") {
    Clock(17, 3) == Clock(-31, 3) should be(true)
  }

  test("clocks with negative hour that wraps multiple times") {
    Clock(13, 49) == Clock(-83, 49) should be(true)
  }

  test("clocks with minute overflow") {
    Clock(0, 1) == Clock(0, 1441) should be(true)
  }

  test("clocks with minute overflow by several days") {
    Clock(2, 2) == Clock(2, 4322) should be(true)
  }

  test("clocks with negative minute") {
    Clock(2, 40) == Clock(3, -20) should be(true)
  }

  test("clocks with negative minute that wraps") {
    Clock(4, 10) == Clock(5, -1490) should be(true)
  }

  test("clocks with negative minute that wraps multiple times") {
    Clock(6, 15) == Clock(6, -4305) should be(true)
  }

  test("clocks with negative hours and minutes") {
    Clock(7, 32) == Clock(-12, -268) should be(true)
  }

  test("clocks with negative hours and minutes that wrap") {
    Clock(18, 7) == Clock(-54, -11513) should be(true)
  }
}
