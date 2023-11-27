module perfect_numbers;

import std.range : iota;
import std.algorithm : filter, sum;
import std.exception : enforce;

enum Classification
{
    DEFICIENT,
    PERFECT,
    ABUNDANT
}

Classification classify(int number)
{
    enforce(number > 0, "Number must be greater than 1");

    int aliquot_sum = iota(1, number - 1).filter!(n => number % n == 0).sum;

    if (aliquot_sum > number) return Classification.ABUNDANT;
    if (aliquot_sum < number) return Classification.DEFICIENT;

    return Classification.PERFECT;
}

unittest
{
    import std.exception : assertThrown;

    // Perfect numbers

    // Smallest perfect number is classified correctly
    assert(classify(6) == Classification.PERFECT);

    // Medium perfect number is classified correctly
    assert(classify(28) == Classification.PERFECT);

    // Large perfect number is classified correctly
    assert(classify(33_550_336) == Classification.PERFECT);

    // Abundant numbers

    // Smallest abundant number is classified correctly
    assert(classify(12) == Classification.ABUNDANT);

    // Medium abundant number is classified correctly
    assert(classify(30) == Classification.ABUNDANT);

    // Large abundant number is classified correctly
    assert(classify(33_550_335) == Classification.ABUNDANT);

    // Deficient numbers

    // Smallest prime deficient number is classified correctly
    assert(classify(2) == Classification.DEFICIENT);

    // Smallest non-prime deficient number is classified correctly
    assert(classify(4) == Classification.DEFICIENT);

    // Medium deficient number is classified correctly
    assert(classify(32) == Classification.DEFICIENT);

    // Large deficient number is classified correctly
    assert(classify(33_550_337) == Classification.DEFICIENT);

    // Edge case (no factors other than itself) is classified correctly
    assert(classify(1) == Classification.DEFICIENT);

    // Invalid inputs

    // Zero is rejected (not a natural number)
    assertThrown(classify(0));

    // Negative integer is rejected (not a natural number)
    assertThrown(classify(-1));
}
