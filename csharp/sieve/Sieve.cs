using System.Collections.Generic;
using System.Linq;

public static class Sieve
{
    public static IEnumerable<int> Primes(int max)
    {
        var possiblePrimes = Enumerable.Range(2, max - 1);

        while (possiblePrimes.Any())
        {
            var prime = possiblePrimes.First();
            yield return prime;

            possiblePrimes = ExcludePrimeMultiples(possiblePrimes, prime);
        }
    }

    private static IEnumerable<int> ExcludePrimeMultiples(IEnumerable<int> possiblePrimes, int prime)
    {
        return possiblePrimes.Where(n => n % prime != 0);
    }
}