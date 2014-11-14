namespace Exercism.gigasecond
{
    using System;

    public class Gigasecond
    {
        private readonly DateTime gigasecondDate;

        public Gigasecond(DateTime birthDate)
        {
            this.gigasecondDate = birthDate.AddSeconds(1000000000).Date;
        }

        public DateTime Date()
        {
            return this.gigasecondDate;
        }
    }
}