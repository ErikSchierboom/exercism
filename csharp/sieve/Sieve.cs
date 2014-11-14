namespace Exercism.sieve
{
    using System.Collections.Generic;
    using System.Linq;

    public class Sieve
    {
        private readonly int max;

        public Sieve(int max)
        {
            this.max = max;
        }

        public IEnumerable<int> Primes
        {
            get
            {
                var possiblePrimes = Enumerable.Range(2, this.max - 1);

                while (possiblePrimes.Any())
                {
                    var prime = possiblePrimes.First();
                    yield return prime;

                    possiblePrimes = ExcludePrimeMultiples(possiblePrimes, prime);
                }
            }
        }

        private static IEnumerable<int> ExcludePrimeMultiples(IEnumerable<int> possiblePrimes, int prime)
        {
            return possiblePrimes.Where(n => n % prime != 0);
        }
    }
}