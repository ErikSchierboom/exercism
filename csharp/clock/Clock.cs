using System;

public struct Clock
{
    private const int MinutesPerHour = 60;
    private const int MinutesPerDay = 1440;

    private readonly int _minutes;
    private readonly int _hours;

    public Clock(int hours, int minutes = 0) =>
        _hours = Math.DivRem(Mod(hours * MinutesPerHour + minutes, MinutesPerDay), MinutesPerHour, out _minutes);

    public Clock Add(int minutes) => new(_hours, _minutes + minutes);

    public Clock Subtract(int minutes) => new(_hours, _minutes - minutes);

    public override string ToString() => $"{_hours:00}:{_minutes:00}";

    private static int Mod(int x, int y) => (x % y + y) % y;
}