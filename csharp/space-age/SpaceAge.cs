public record SpaceAge(ulong Seconds)
{
    private const ulong SecondsOnEarth = 31557600;

    public double OnEarth() => FromPeriodInEarthYears(1.0d);

    public double OnMercury() => FromPeriodInEarthYears(0.2408467d);

    public double OnVenus() => FromPeriodInEarthYears(0.61519726d);

    public double OnMars() => FromPeriodInEarthYears(1.8808158d);

    public double OnJupiter() => FromPeriodInEarthYears(11.862615d);

    public double OnSaturn() => FromPeriodInEarthYears(29.447498d);

    public double OnUranus() => FromPeriodInEarthYears(84.016846d);

    public double OnNeptune() => FromPeriodInEarthYears(164.79132d);

    private double FromPeriodInEarthYears(double period) => Seconds / period / SecondsOnEarth;
}