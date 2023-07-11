import org.scalatest.{Matchers, FunSuite}

/** @version 2.1.0 */
class NthPrimeTest extends FunSuite with Matchers {
  
  test("first prime") {
    NthPrime.prime(1) should be (Some(2))
  }

  test("second prime") {
    NthPrime.prime(2) should be (Some(3))
  }

  test("sixth prime") {
    NthPrime.prime(6) should be (Some(13))
  }

  test("big prime") {
    NthPrime.prime(10001) should be (Some(104743))
  }

  test("there is no zeroth prime") {
    NthPrime.prime(0) should be (None)
  }
}