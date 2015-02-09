import org.joda.time.DateTime;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public final class Meetup {
    private Map<Integer, List<DateTime>> days;

    public Meetup(int month, int year) {
        this.days =  IntStream.rangeClosed(1, daysInMonth(month, year))
                              .boxed()
                              .map(day -> new DateTime(year, month, day, 0, 0))
                              .collect(Collectors.groupingBy(date -> date.getDayOfWeek()));
    }

    public DateTime day(int weekDay, MeetupSchedule schedule) {
        List<DateTime> weekDays = this.days.get(weekDay);

        if (schedule == MeetupSchedule.TEENTH) {
            return weekDays.stream().filter(d -> d.getDayOfMonth() >= 13).findFirst().get();
        }

        return weekDays.get(Math.min(weekDays.size() - 1, schedule.ordinal()));
    }

    private int daysInMonth(int month, int year) {
        DateTime date = new DateTime(year, month, 1, 0, 0);
        return date.dayOfMonth().getMaximumValue();
    }
}