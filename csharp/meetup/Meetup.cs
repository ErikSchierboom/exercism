using System;
using System.Linq;

public class Meetup
{
    private readonly ILookup<DayOfWeek, DateTime> days;

    public Meetup(int month, int year)
    {
        this.days = Enumerable.Range(1, DateTime.DaysInMonth(year, month))
            .Select(day => new DateTime(year, month, day))
            .ToLookup(d => d.DayOfWeek);
    }

    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule)
    {
        var daysOfWeek = this.days[dayOfWeek];

        if (schedule == Schedule.Teenth)
        {
            return daysOfWeek.First(d => d.Day >= 13);
        }

        return daysOfWeek.ElementAt(Math.Min((int)schedule, daysOfWeek.Count() - 1));
    }
}

public enum Schedule
{
    First,
    Second,
    Third,
    Fourth,
    Last,
    Teenth
}