import org.junit.Ignore
import org.junit.Test
import java.time.DayOfWeek
import java.time.LocalDate
import kotlin.test.assertEquals

class MeetupTest {

    @Test
    fun testMonteenthOfMay2013() {
        val expected = LocalDate.of(2013, 5, 13)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testMonteenthOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 19)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testMonteenthOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 16)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testTuesteenthOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 19)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testTuesteenthOfApril2013() {
        val expected = LocalDate.of(2013, 4, 16)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testTuesteenthOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 13)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testWednesteenthOfJanuary2013() {
        val expected = LocalDate.of(2013, 1, 16)
        val meetup = Meetup(1, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testWednesteenthOfFebruary2013() {
        val expected = LocalDate.of(2013, 2, 13)
        val meetup = Meetup(2, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testWednesteenthOfJune2013() {
        val expected = LocalDate.of(2013, 6, 19)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testThursteenthOfMay2013() {
        val expected = LocalDate.of(2013, 5, 16)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testThursteenthOfJune2013() {
        val expected = LocalDate.of(2013, 6, 13)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testThursteenthOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 19)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testFriteenthOfApril2013() {
        val expected = LocalDate.of(2013, 4, 19)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testFriteenthOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 16)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testFriteenthOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 13)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testSaturteenthOfFebruary2013() {
        val expected = LocalDate.of(2013, 2, 16)
        val meetup = Meetup(2, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testSaturteenthOfApril2013() {
        val expected = LocalDate.of(2013, 4, 13)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testSaturteenthOfOctober2013() {
        val expected = LocalDate.of(2013, 10, 19)
        val meetup = Meetup(10, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testSunteenthOfMay2013() {
        val expected = LocalDate.of(2013, 5, 19)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testSunteenthOfJune2013() {
        val expected = LocalDate.of(2013, 6, 16)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testSunteenthOfOctober2013() {
        val expected = LocalDate.of(2013, 10, 13)
        val meetup = Meetup(10, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.TEENTH))
    }

    @Test
    fun testFirstMondayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 4)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstMondayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 1)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstTuesdayOfMay2013() {
        val expected = LocalDate.of(2013, 5, 7)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstTuesdayOfJune2013() {
        val expected = LocalDate.of(2013, 6, 4)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstWednesdayOfJuly2013() {
        val expected = LocalDate.of(2013, 7, 3)
        val meetup = Meetup(7, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstWednesdayOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 7)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstThursdayOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 5)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstThursdayOfOctober2013() {
        val expected = LocalDate.of(2013, 10, 3)
        val meetup = Meetup(10, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstFridayOfNovember2013() {
        val expected = LocalDate.of(2013, 11, 1)
        val meetup = Meetup(11, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstFridayOfDecember2013() {
        val expected = LocalDate.of(2013, 12, 6)
        val meetup = Meetup(12, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstSaturdayOfJanuary2013() {
        val expected = LocalDate.of(2013, 1, 5)
        val meetup = Meetup(1, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstSaturdayOfFebruary2013() {
        val expected = LocalDate.of(2013, 2, 2)
        val meetup = Meetup(2, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstSundayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 3)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testFirstSundayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 7)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.FIRST))
    }

    @Test
    fun testSecondMondayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 11)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondMondayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 8)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondTuesdayOfMay2013() {
        val expected = LocalDate.of(2013, 5, 14)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondTuesdayOfJune2013() {
        val expected = LocalDate.of(2013, 6, 11)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondWednesdayOfJuly2013() {
        val expected = LocalDate.of(2013, 7, 10)
        val meetup = Meetup(7, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondWednesdayOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 14)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondThursdayOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 12)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondThursdayOfOctober2013() {
        val expected = LocalDate.of(2013, 10, 10)
        val meetup = Meetup(10, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondFridayOfNovember2013() {
        val expected = LocalDate.of(2013, 11, 8)
        val meetup = Meetup(11, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondFridayOfDecember2013() {
        val expected = LocalDate.of(2013, 12, 13)
        val meetup = Meetup(12, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondSaturdayOfJanuary2013() {
        val expected = LocalDate.of(2013, 1, 12)
        val meetup = Meetup(1, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondSaturdayOfFebruary2013() {
        val expected = LocalDate.of(2013, 2, 9)
        val meetup = Meetup(2, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondSundayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 10)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testSecondSundayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 14)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.SECOND))
    }

    @Test
    fun testThirdMondayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 18)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdMondayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 15)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdTuesdayOfMay2013() {
        val expected = LocalDate.of(2013, 5, 21)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdTuesdayOfJune2013() {
        val expected = LocalDate.of(2013, 6, 18)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdWednesdayOfJuly2013() {
        val expected = LocalDate.of(2013, 7, 17)
        val meetup = Meetup(7, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdWednesdayOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 21)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdThursdayOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 19)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdThursdayOfOctober2013() {
        val expected = LocalDate.of(2013, 10, 17)
        val meetup = Meetup(10, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdFridayOfNovember2013() {
        val expected = LocalDate.of(2013, 11, 15)
        val meetup = Meetup(11, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdFridayOfDecember2013() {
        val expected = LocalDate.of(2013, 12, 20)
        val meetup = Meetup(12, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdSaturdayOfJanuary2013() {
        val expected = LocalDate.of(2013, 1, 19)
        val meetup = Meetup(1, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdSaturdayOfFebruary2013() {
        val expected = LocalDate.of(2013, 2, 16)
        val meetup = Meetup(2, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdSundayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 17)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testThirdSundayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 21)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.THIRD))
    }

    @Test
    fun testFourthMondayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 25)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthMondayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 22)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthTuesdayOfMay2013() {
        val expected = LocalDate.of(2013, 5, 28)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthTuesdayOfJune2013() {
        val expected = LocalDate.of(2013, 6, 25)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthWednesdayOfJuly2013() {
        val expected = LocalDate.of(2013, 7, 24)
        val meetup = Meetup(7, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthWednesdayOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 28)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthThursdayOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 26)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthThursdayOfOctober2013() {
        val expected = LocalDate.of(2013, 10, 24)
        val meetup = Meetup(10, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthFridayOfNovember2013() {
        val expected = LocalDate.of(2013, 11, 22)
        val meetup = Meetup(11, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthFridayOfDecember2013() {
        val expected = LocalDate.of(2013, 12, 27)
        val meetup = Meetup(12, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthSaturdayOfJanuary2013() {
        val expected = LocalDate.of(2013, 1, 26)
        val meetup = Meetup(1, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthSaturdayOfFebruary2013() {
        val expected = LocalDate.of(2013, 2, 23)
        val meetup = Meetup(2, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthSundayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 24)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testFourthSundayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 28)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.FOURTH))
    }

    @Test
    fun testLastMondayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 25)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastMondayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 29)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.MONDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastTuesdayOfMay2013() {
        val expected = LocalDate.of(2013, 5, 28)
        val meetup = Meetup(5, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastTuesdayOfJune2013() {
        val expected = LocalDate.of(2013, 6, 25)
        val meetup = Meetup(6, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.TUESDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastWednesdayOfJuly2013() {
        val expected = LocalDate.of(2013, 7, 31)
        val meetup = Meetup(7, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastWednesdayOfAugust2013() {
        val expected = LocalDate.of(2013, 8, 28)
        val meetup = Meetup(8, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastThursdayOfSeptember2013() {
        val expected = LocalDate.of(2013, 9, 26)
        val meetup = Meetup(9, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastThursdayOfOctober2013() {
        val expected = LocalDate.of(2013, 10, 31)
        val meetup = Meetup(10, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.THURSDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastFridayOfNovember2013() {
        val expected = LocalDate.of(2013, 11, 29)
        val meetup = Meetup(11, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastFridayOfDecember2013() {
        val expected = LocalDate.of(2013, 12, 27)
        val meetup = Meetup(12, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastSaturdayOfJanuary2013() {
        val expected = LocalDate.of(2013, 1, 26)
        val meetup = Meetup(1, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastSaturdayOfFebruary2013() {
        val expected = LocalDate.of(2013, 2, 23)
        val meetup = Meetup(2, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SATURDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastSundayOfMarch2013() {
        val expected = LocalDate.of(2013, 3, 31)
        val meetup = Meetup(3, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastSundayOfApril2013() {
        val expected = LocalDate.of(2013, 4, 28)
        val meetup = Meetup(4, 2013)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastWednesdayOfFebruary2012() {
        val expected = LocalDate.of(2012, 2, 29)
        val meetup = Meetup(2, 2012)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastWednesdayOfDecember2014() {
        val expected = LocalDate.of(2014, 12, 31)
        val meetup = Meetup(12, 2014)
        assertEquals(expected, meetup.day(DayOfWeek.WEDNESDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testLastSundayOfFebruary2015() {
        val expected = LocalDate.of(2015, 2, 22)
        val meetup = Meetup(2, 2015)
        assertEquals(expected, meetup.day(DayOfWeek.SUNDAY, MeetupSchedule.LAST))
    }

    @Test
    fun testFirstFridayOfDecember2012() {
        val expected = LocalDate.of(2012, 12, 7)
        val meetup = Meetup(12, 2012)
        assertEquals(expected, meetup.day(DayOfWeek.FRIDAY, MeetupSchedule.FIRST))
    }

}
