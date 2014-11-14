namespace Exercism
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
            return this.SecondsWithPlanetPeriod(EarthPeriod);
        }

        public double OnMercury()
        {
            return this.SecondsWithPlanetPeriod(MercuryPeriod);
        }

        public double OnVenus()
        {
            return this.SecondsWithPlanetPeriod(VenusPeriod);
        }

        public double OnMars()
        {
            return this.SecondsWithPlanetPeriod(MarsPeriod);
        }

        public double OnJupiter()
        {
            return this.SecondsWithPlanetPeriod(JupiterPeriod);
        }

        public double OnSaturn()
        {
            return this.SecondsWithPlanetPeriod(SaturnPeriod);
        }

        public double OnUranus()
        {
            return this.SecondsWithPlanetPeriod(UranusPeriod);
        }

        public double OnNeptune()
        {
            return this.SecondsWithPlanetPeriod(NeptunePeriod);
        }

        private double SecondsWithPlanetPeriod(double period)
        {
            return (this.Seconds / period) / SecondsOnEarth;
        }
    }
}