public class SpaceAge {

    private final long SecondsOnEarth = 31557600L;

    private final double MercuryPeriod = 0.2408467d;
    private final double VenusPeriod = 0.61519726d;
    private final double EarthPeriod = 1.0d;
    private final double MarsPeriod = 1.8808158d;
    private final double JupiterPeriod = 11.862615d;
    private final double SaturnPeriod = 29.447498d;
    private final double UranusPeriod = 84.016846d;
    private final double NeptunePeriod = 164.79132d;

    private long seconds;

    public SpaceAge(int seconds) {
        this.seconds = seconds;
    }

    public SpaceAge(long seconds) {
        this.seconds = seconds;
    }

    public long getSeconds() {
        return this.seconds;
    }

    public double onEarth() {
        return this.secondsWithPlanetPeriod(EarthPeriod);
    }

    public double onMercury() {
        return this.secondsWithPlanetPeriod(MercuryPeriod);
    }

    public double onVenus() {
        return this.secondsWithPlanetPeriod(VenusPeriod);
    }

    public double onMars() {
        return this.secondsWithPlanetPeriod(MarsPeriod);
    }

    public double onJupiter() {
        return this.secondsWithPlanetPeriod(JupiterPeriod);
    }

    public double onSaturn() {
        return this.secondsWithPlanetPeriod(SaturnPeriod);
    }

    public double onUranus() {
        return this.secondsWithPlanetPeriod(UranusPeriod);
    }

    public double onNeptune() {
        return this.secondsWithPlanetPeriod(NeptunePeriod);
    }

    private double secondsWithPlanetPeriod(double period) {
        return (this.getSeconds() / period) / SecondsOnEarth;
    }
}