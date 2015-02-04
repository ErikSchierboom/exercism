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

    public DateTime day(int weekDay, MeetupSchedule teenth) {
        switch (teenth) {
            case FIRST:
                return this.days.get(weekDay).get(0);
            case SECOND:
                return this.days.get(weekDay).get(1);
            case THIRD:
                return this.days.get(weekDay).get(2);
            case FOURTH:
                return this.days.get(weekDay).get(3);
            case LAST:
                return this.days.get(weekDay).get(this.days.get(weekDay).size() - 1);
            case TEENTH:
                return this.days.get(weekDay).stream().filter(d -> d.getDayOfMonth() >= 13).findFirst().get();
            default:
                throw new IllegalArgumentException();
        }
    }

    private int daysInMonth(int month, int year) {
        DateTime date = new DateTime(year, month, 1, 0, 0);
        return date.dayOfMonth().getMaximumValue();
    }
}