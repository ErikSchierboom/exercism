import org.joda.time.DateTime;

public final class Meetup {
    private final int month;
    private final int year;

    public Meetup(int month, int year) {
        this.month = month;
        this.year = year;
    }

    public DateTime day(int weekDay, MeetupSchedule schedule) {
        if (schedule == MeetupSchedule.TEENTH) {
            return getTeenthWeekDay(weekDay);
        }

        if (schedule == MeetupSchedule.LAST) {
            return getLastWeekDay(weekDay);
        }

        return getNthWeekDay(weekDay, schedule.ordinal());
    }

    private DateTime getNthWeekDay(int weekDay, int nth) {
        return this.getFirstWeekDay(weekDay).plusWeeks(nth);
    }

    private DateTime getFirstWeekDay(int weekDay) {
        DateTime firstWeekDay = getFirstDayOfMonth();

        while (firstWeekDay.getDayOfWeek() != weekDay) {
            firstWeekDay = firstWeekDay.plusDays(1);
        }

        return firstWeekDay;
    }

    private DateTime getLastWeekDay(int weekDay) {
        DateTime lastWeekDay = getLastDayOfMonth();

        while (lastWeekDay.getDayOfWeek() != weekDay) {
            lastWeekDay = lastWeekDay.minusDays(1);
        }

        return lastWeekDay;
    }

    private DateTime getTeenthWeekDay(int weekDay) {
        DateTime teenthWeekDay = getFirstWeekDay(weekDay).plusWeeks(1);

        while (teenthWeekDay.getDayOfMonth() < 13) {
            teenthWeekDay = teenthWeekDay.plusWeeks(1);
        }

        return teenthWeekDay;
    }

    private DateTime getFirstDayOfMonth() {
        return new DateTime(year, month, 1, 0, 0);
    }

    private DateTime getLastDayOfMonth() {
        return getFirstDayOfMonth().plusMonths(1).minusDays(1);
    }
}