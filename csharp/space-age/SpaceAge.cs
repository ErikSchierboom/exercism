namespace space_age
{
    public class SpaceAge
    {
        private const ulong SecondsOnEarth = 31557600;

        private const double MercuryPeriod = 0.2408467d;
        private const double VenusPeriod = 0.61519726d;
        private const double EarthPeriod = 1.0d;
        private const double MarsPeriod = 1.8808158d;
        private const double JupiterPeriod = 11.862615d;
        private const double SaturnPeriod = 29.447498d;
        private const double UranusPeriod = 84.016846d;
        private const double NeptunePeriod = 164.79132d;

        public SpaceAge(ulong seconds)
        {
            this.Seconds = seconds;
        }

        public ulong Seconds { get; private set; }

        public double OnEarth()
        {
            return SecondsWithPlanetPeriod(EarthPeriod);
        }

        public double OnMercury()
        {
            return SecondsWithPlanetPeriod(MercuryPeriod);
        }

        public double OnVenus()
        {
            return SecondsWithPlanetPeriod(VenusPeriod);
        }

        public double OnMars()
        {
            return SecondsWithPlanetPeriod(MarsPeriod);
        }

        public double OnJupiter()
        {
            return SecondsWithPlanetPeriod(JupiterPeriod);
        }

        public double OnSaturn()
        {
            return SecondsWithPlanetPeriod(SaturnPeriod);
        }

        public double OnUranus()
        {
            return SecondsWithPlanetPeriod(UranusPeriod);
        }

        public double OnNeptune()
        {
            return SecondsWithPlanetPeriod(NeptunePeriod);
        }

        private double SecondsWithPlanetPeriod(double period)
        {
            return (this.Seconds / period) / SecondsOnEarth;
        }
    }
}