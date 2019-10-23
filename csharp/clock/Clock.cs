public struct Clock
{
    private const int MinutesPerHour = 60;
    private const int MinutesPerDay = 1440;

    private readonly int _minutes;

    public Clock(int hours, int minutes = 0) => _minutes = Mod(hours * MinutesPerHour + minutes, MinutesPerDay);

    public Clock Add(int minutes) => new Clock(Hours, Minutes + minutes);

    public Clock Subtract(int minutes) => new Clock(Hours, Minutes - minutes);

    public override string ToString() => $"{Hours:00}:{Minutes:00}";

    public int Hours => _minutes / MinutesPerHour;

    public int Minutes => _minutes % MinutesPerHour;

    private static int Mod(int x, int y) => (int)((x % y + y) % y);
}