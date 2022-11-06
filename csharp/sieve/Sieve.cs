using System;
using System.Collections;
using System.Collections.Generic;

public static class Sieve
{
    public static IEnumerable<int> Primes(int max)
    {
        if (max < 0)
            throw new ArgumentOutOfRangeException(nameof(max));

        var primes = new BitArray(max + 1, true);

        for (var i = 2; i <= max; i++)
        {
            if (!primes[i])
                continue;

            for (var j = i * 2; j <= max; j += i)
                primes[j] = false;

            yield return i;
        }
    }
}