namespace Exercism
{
    using System.Collections.Generic;

    public static class PrimeFactors
    {
        public static IEnumerable<long> For(long number)
        {
            var factor = 2;

            while (number > 1)
            {
                while (number % factor != 0)
                {
                    factor++;
                }

                number /= factor;

                yield return factor;
            }
        }
    }
}