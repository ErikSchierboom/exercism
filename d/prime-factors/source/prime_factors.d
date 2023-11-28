module prime_factors;

int[] factors(long number)
{
    int[] result;
    int factor = 2;

    while (number > 1)
    {
        while (number % factor != 0)
            factor += factor == 2 ? 1 : 2;

        number /= factor;
        result ~= factor;
    }

    return result;
}

unittest
{
    immutable bool allTestsEnabled = true;

    // No factors
    assert(factors(1) == []);

    static if (allTestsEnabled)
    {
        // Prime number
        assert(factors(2) == [2]);

        // Square of a prime
        assert(factors(9) == [3, 3]);

        // Cube of a prime
        assert(factors(8) == [2, 2, 2]);

        // Product of primes and non-primes
        assert(factors(12) == [2, 2, 3]);

        // Product of primes
        assert(factors(901_255) == [5, 17, 23, 461]);

        // Factors include a large prime
        assert(factors(93_819_012_551) == [11, 9539, 894_119]);
    }
}
