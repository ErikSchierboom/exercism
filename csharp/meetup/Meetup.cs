using System;
using System.Collections.Generic;
using System.Linq;

public enum Schedule
{
    Teenth,
    First,
    Second,
    Third,
    Fourth,
    Last
}

public record Meetup(int month, int year)
{
    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule) =>
        schedule switch
        {
            Schedule.First => WeekDays(dayOfWeek).First(),
            Schedule.Second => WeekDays(dayOfWeek).ElementAt(1),
            Schedule.Third => WeekDays(dayOfWeek).ElementAt(2),
            Schedule.Fourth => WeekDays(dayOfWeek).ElementAt(3),
            Schedule.Last => WeekDays(dayOfWeek).Last(),
            Schedule.Teenth => WeekDays(dayOfWeek).First(date => date.Day >= 13),
        };

    private IEnumerable<DateTime> WeekDays(DayOfWeek dayOfWeek)
    {
        for (var day = 1; day <= DateTime.DaysInMonth(year, month); day++)
        {
            var date = new DateTime(year, month, day);
            if (date.DayOfWeek == dayOfWeek)
                yield return date;
        }
    }
}