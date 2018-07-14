import java.util.{Calendar, GregorianCalendar}

case class Meetup(month: Int, year: Int) {

  lazy val dates = (1 to numberOfDaysInMonth).map(createDateForDay)
  lazy val daysMap = dates.groupBy(Meetup.Day.fromDate)
  lazy val teenthDaysMap = (13 to 19).groupBy(createDay)

  def createDateForDay(day: Int) = new GregorianCalendar(year, month - 1, day)
  def createDay(day: Int) = Meetup.Day.fromDate(createDateForDay(day))

  def firstDayOfMonth = createDateForDay(1)
  def numberOfDaysInMonth = firstDayOfMonth.getActualMaximum(Calendar.DAY_OF_MONTH)

  def teenth(day: Meetup.Day): GregorianCalendar = dates(teenthDaysMap(day)(0) - 1)
  def first(day: Meetup.Day): GregorianCalendar = daysMap(day)(0)
  def second(day: Meetup.Day): GregorianCalendar = daysMap(day)(1)
  def third(day: Meetup.Day): GregorianCalendar = daysMap(day)(2)
  def fourth(day: Meetup.Day): GregorianCalendar = daysMap(day)(3)
  def last(day: Meetup.Day): GregorianCalendar = daysMap(day)(daysMap(day).size - 1)
}

object Meetup {
  sealed abstract class Day()

  case object Mon extends Day
  case object Tue extends Day
  case object Wed extends Day
  case object Thu extends Day
  case object Fri extends Day
  case object Sat extends Day
  case object Sun extends Day

  object Day {
    def fromDate(date: GregorianCalendar): Day =
      date.get(Calendar.DAY_OF_WEEK) match {
        case 1 => Sun
        case 2 => Mon
        case 3 => Tue
        case 4 => Wed
        case 5 => Thu
        case 6 => Fri
        case 7 => Sat
        case _ => throw new IllegalArgumentException
      }
  }
}