import java.time.DayOfWeek
import java.time.LocalDate
import java.time.YearMonth

class Meetup(month: Int, year: Int) {
    private val yearMonth = YearMonth.of(year, month)
    private val daysOfWeekForYearMonth = (1 .. yearMonth.lengthOfMonth())
            .map(yearMonth::atDay)
            .groupBy { it.dayOfWeek }

    fun day(dayOfWeek: DayOfWeek, schedule: MeetupSchedule): LocalDate {
        val daysOfWeek = daysOfWeekForYearMonth.getOrDefault(dayOfWeek, emptyList())

        return when (schedule) {
            MeetupSchedule.FIRST -> daysOfWeek.first()
            MeetupSchedule.SECOND -> daysOfWeek[1]
            MeetupSchedule.THIRD -> daysOfWeek[2]
            MeetupSchedule.FOURTH -> daysOfWeek[3]
            MeetupSchedule.LAST -> daysOfWeek.last()
            MeetupSchedule.TEENTH -> daysOfWeek.first { it.dayOfMonth >= 13 }
        }
    }
}