using System;

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
    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule)
    {
        var firstDayOfSchedule = schedule switch
        {
            Schedule.First => 1,
            Schedule.Second => 8,
            Schedule.Third => 15,
            Schedule.Fourth => 22,
            Schedule.Teenth => 13,
            Schedule.Last => DateTime.DaysInMonth(year, month) - 6
        };
        var firstDateOfSchedule = new DateTime(year, month, firstDayOfSchedule);
        var weekdayOffset = (dayOfWeek - firstDateOfSchedule.DayOfWeek + 7) % 7;
        return firstDateOfSchedule.AddDays(weekdayOffset);
    }
}