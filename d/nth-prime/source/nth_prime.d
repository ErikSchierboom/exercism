module nth_prime;

import std.conv: to;
import std.math: floor, sqrt;
import std.exception : enforce;

int prime(int nth)
{
    enforce(nth > 0, "Number must be positive");

    if (nth == 1) return 2;
    if (nth == 2) return 3;

    nth -= 2;
    int n = 6;

    while (true)
    {
        if (is_prime(n - 1) && nth-- == 1)
            return (n - 1);

        if (is_prime(n + 1) && nth-- == 1)
            return (n + 1);

        n += 6;
    }
}

bool is_prime(int candidate)
{
    auto r = candidate.to!double.sqrt.floor;
    if (r < 5) return true;

    for (auto i = 5; i < r + 1; i += 2) {
        if (candidate % i == 0)
            return false;
    }

    return true;
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 1;

    // First prime
    assert(prime(1) == 2);

    static if (allTestsEnabled)
    {
        // Second prime
        assert(prime(2) == 3);

        // Sixth prime
        assert(prime(6) == 13);

        // Big prime
        assert(prime(10_001) == 10_4743);

        // There is no zeroth prime
        assertThrown(prime(0));
    }

}
