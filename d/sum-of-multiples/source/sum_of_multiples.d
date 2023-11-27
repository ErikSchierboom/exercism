module sum_of_multiples;

import std.range : iota;
import std.algorithm : filter, any, sum;

int calculateSum(int[] factors, int limit)
{
    return iota(1, limit)
        .filter!(n => factors.any!(factor => factor != 0 && n % factor == 0))
        .sum;
}

unittest
{
    // No multiples within limit
    assert(calculateSum([3, 5], 1) == 0);

    // One factor has multiples within limit
    assert(calculateSum([3, 5], 4) == 3);

    // More than one multiple within limit
    assert(calculateSum([3], 7) == 9);

    // More than one factor with multiples within limit
    assert(calculateSum([3, 5], 10) == 23);

    // Each multiple is only counted once
    assert(calculateSum([3, 5], 100) == 2318);

    // A much larger limit
    assert(calculateSum([3, 5], 1000) == 233168);

    // Three factors
    assert(calculateSum([7, 13, 17], 20) == 51);

    // Factors not relatively prime
    assert(calculateSum([4, 6], 15) == 30);

    // Some pairs of factors relatively prime and some not
    assert(calculateSum([5, 6, 8], 150) == 4419);

    // One factor is a multiple of another
    assert(calculateSum([5, 25], 51) == 275);

    // Much larger factors
    assert(calculateSum([43, 47], 10000) == 2203160);

    // All numbers are multiples of 1
    assert(calculateSum([1], 100) == 4950);

    // No factors means an empty sum
    assert(calculateSum([0], 10000) == 0);

    // The only multiple of 0 is 0
    assert(calculateSum([0], 1) == 0);

    // The factor 0 does not affect the sum of multiples of other factors
    assert(calculateSum([3, 0], 4) == 3);

    // Solutions using include-exclude must extend to cardinality greater than 3
    assert(calculateSum([2, 3, 5, 7, 11], 10000) == 39614537);
}
