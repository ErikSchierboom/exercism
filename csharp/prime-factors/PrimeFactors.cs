using System.Collections.Generic;

public static class PrimeFactors
{
    public static IEnumerable<long> Factors(long number)
    {
        var factor = 2;

        while (number > 1)
        {
            while (number % factor != 0)
            {
                factor += factor == 2 ? 1 : 2;
            }

            number /= factor;

            yield return factor;
        }
    }
}
