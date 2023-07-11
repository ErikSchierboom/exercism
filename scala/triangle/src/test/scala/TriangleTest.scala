import org.scalatest.{Matchers, FunSuite}

/** @version 1.1.0 */
class TriangleTest extends FunSuite with Matchers {

  test("equilateral - true if all sides are equal") {
    Triangle(2, 2, 2).equilateral should be (true)
  }

  test("equilateral - false if any side is unequal") {
    Triangle(2, 3, 2).equilateral should be (false)
  }

  test("equilateral - false if no sides are equal") {
    Triangle(5, 4, 6).equilateral should be (false)
  }

  test("equilateral - All zero sides are illegal, so the triangle is not equilateral") {
    Triangle(0, 0, 0).equilateral should be (false)
  }

  test("equilateral - sides may be floats") {
    Triangle(0.5, 0.5, 0.5).equilateral should be (true)
  }

  test("isosceles - true if last two sides are equal") {
    Triangle(3, 4, 4).isosceles should be (true)
  }

  test("isosceles - true if first two sides are equal") {
    Triangle(4, 4, 3).isosceles should be (true)
  }

  test("isosceles - true if first and last sides are equal") {
    Triangle(4, 3, 4).isosceles should be (true)
  }

  test("isosceles - equilateral triangles are also isosceles") {
    Triangle(4, 4, 4).isosceles should be (true)
  }

  test("isosceles - false if no sides are equal") {
    Triangle(2, 3, 4).isosceles should be (false)
  }

  test("isosceles - Sides that violate triangle inequality are not isosceles, even if two are equal") {
    Triangle(1, 1, 3).isosceles should be (false)
  }

  test("isosceles - sides may be floats") {
    Triangle(0.5, 0.4, 0.5).isosceles should be (true)
  }

  test("scalene - true if no sides are equal") {
    Triangle(5, 4, 6).scalene should be (true)
  }

  test("scalene - false if all sides are equal") {
    Triangle(4, 4, 4).scalene should be (false)
  }

  test("scalene - false if two sides are equal") {
    Triangle(4, 4, 3).scalene should be (false)
  }

  test("scalene - Sides that violate triangle inequality are not scalene, even if they are all different") {
    Triangle(7, 3, 2).scalene should be (false)
  }

  test("scalene - sides may be floats") {
    Triangle(0.5, 0.4, 0.6).scalene should be (true)
  }
}
