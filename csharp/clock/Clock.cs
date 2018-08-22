public struct Clock
{
    private const int HoursPerDay = 24;
    private const int MinutesPerHour = 60;

    public Clock(int hours, int minutes)
    {
        Hours = Mod((hours * MinutesPerHour + minutes) / (float)MinutesPerHour, HoursPerDay);
        Minutes = Mod(minutes, MinutesPerHour);
    }

    public int Hours { get; }

    public int Minutes { get; }

    public Clock Add(int minutesToAdd) => new Clock(Hours, Minutes + minutesToAdd);

    public Clock Subtract(int minutesToSubtract) => new Clock(Hours, Minutes - minutesToSubtract);

    public override string ToString() => $"{Hours:00}:{Minutes:00}";

    private static int Mod(double x, double y) => (int)(((x % y) + y) % y);
}