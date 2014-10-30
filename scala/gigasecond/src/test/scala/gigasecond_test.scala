import org.scalatest._
import java.util.GregorianCalendar

class GigasecondTests extends FunSuite with Matchers {
  test ("1") {
    // Note: Months are 0-indexed. 3 = April
    val gs = Gigasecond(new GregorianCalendar(2011, 3, 25))
    gs.date should be (new GregorianCalendar(2043, 0, 1))
  }

  test ("2") {
    val gs = Gigasecond(new GregorianCalendar(1977, 5, 13))
    gs.date should be (new GregorianCalendar(2009, 1, 19))
  }

  test ("3") {
    val gs = Gigasecond(new GregorianCalendar(1959, 6, 19))
    gs.date should be (new GregorianCalendar(1991, 2, 27))
  }

  test ("yourself") {
     val yourBirthday = new GregorianCalendar(1981, 5, 3)
     val gs = Gigasecond(yourBirthday)
     gs.date should be (new GregorianCalendar(2013, 1, 9))
  }
}
