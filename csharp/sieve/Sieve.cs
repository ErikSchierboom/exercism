using System;
using System.Collections.Generic;
using System.Linq;

public static class Sieve
{
    public static IEnumerable<int> Primes(int max)
    {
        if (max < 2)
            throw new ArgumentOutOfRangeException(nameof(max));
        
        var possiblePrimes = Enumerable.Range(2, max - 1).ToList();

        return Sieve(possiblePrimes);

        IEnumerable<int> Sieve(List<int> unsievedPrimes)
        {
            while (unsievedPrimes.Any())
            {
                var prime = unsievedPrimes[0];
                yield return prime;

                unsievedPrimes = ExcludePrimeMultiples(unsievedPrimes, prime);
            }
        }
        
        List<int> ExcludePrimeMultiples(List<int> unsievedPrimes, int prime) => unsievedPrimes.Where(n => n % prime != 0).ToList();
    }
}