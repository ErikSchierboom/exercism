using System;

public class Clock : IEquatable<Clock>, IComparable<Clock>
{
    private readonly int hours;
    private readonly int minutes;
    private readonly int totalMinutes;

    public Clock(int hours, int minutes = 0)
    {
        this.totalMinutes = hours * 60 + minutes;
        this.hours = Mod(this.totalMinutes / 60.0, 24);
        this.minutes = Mod(minutes, 60);
    }

    public Clock Add(int minutesToAdd)
    {
        return new Clock(this.hours, this.minutes + minutesToAdd);
    }

    public Clock Subtract(int minutesToSubtract)
    {
        return new Clock(this.hours, this.minutes + (-minutesToSubtract));
    }

    public override string ToString()
    {
        return string.Format("{0:00}:{1:00}", this.hours, this.minutes);
    }

    public bool Equals(Clock other)
    {
        if (other == null)
        {
            return false;
        }

        return this.totalMinutes.Equals(other.totalMinutes);
    }

    public int CompareTo(Clock other)
    {
        if (other == null)
        {
            return 1;
        }

        return this.totalMinutes.CompareTo(other.totalMinutes);
    }

    public override bool Equals(object obj)
    {
        return this.Equals(obj as Clock);
    }

    public override int GetHashCode()
    {
        return this.totalMinutes.GetHashCode();
    }

    private static int Mod(double x, double y)
    {
        return (int)(((x % y) + y) % y);
    }
}