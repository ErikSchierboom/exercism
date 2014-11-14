namespace Exercism.meetup
{
    using System;
    using System.Linq;

    public class Meetup
    {
        private readonly ILookup<DayOfWeek, DateTime> days;
        private readonly ILookup<DayOfWeek, DateTime> teenthDays;

        public Meetup(int month, int year)
        {
            this.days = Enumerable.Range(1, DateTime.DaysInMonth(year, month))
                .Select(day => new DateTime(year, month, day))
                .ToLookup(d => d.DayOfWeek);

            this.teenthDays = Enumerable.Range(13, 7)
                .Select(day => new DateTime(year, month, day))
                .ToLookup(d => d.DayOfWeek, d => d);
        }

        public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule)
        {
            switch (schedule)
            {
                case Schedule.Teenth:
                    return this.teenthDays[dayOfWeek].First();
                case Schedule.First:
                    return this.days[dayOfWeek].First();
                case Schedule.Second:
                    return this.days[dayOfWeek].ElementAt(1);
                case Schedule.Third:
                    return this.days[dayOfWeek].ElementAt(2);
                case Schedule.Fourth:
                    return this.days[dayOfWeek].ElementAt(3);
                case Schedule.Last:
                    return this.days[dayOfWeek].Last();
                default:
                    throw new ArgumentOutOfRangeException("schedule");
            }
        }
    }

    public enum Schedule
    {
        Teenth,
        First,
        Second,
        Third,
        Fourth,
        Last,
    }
}