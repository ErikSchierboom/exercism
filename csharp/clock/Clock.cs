namespace Exercism.clock
{
    public class Clock
    {
        private readonly int hours;
        private readonly int minutes;

        public Clock(int hours, int minutes = 0)
        {
            var totalMinutes = hours * 60 + minutes;

            this.hours = Mod(totalMinutes / 60.0, 24);
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

        private static int Mod(double x, double y)
        {
            return (int)(((x % y) + y) % y);
        }
    }
}