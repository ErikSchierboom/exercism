// This file was auto-generated based on version 1.1.0 of the canonical data.

using Xunit;
using System;

public class PerfectNumbersTest
{
    [Fact]
    public void Smallest_perfect_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Perfect, PerfectNumbers.Classify(6));
    }

    [Fact]
    public void Medium_perfect_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Perfect, PerfectNumbers.Classify(28));
    }

    [Fact]
    public void Large_perfect_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Perfect, PerfectNumbers.Classify(33550336));
    }

    [Fact]
    public void Smallest_abundant_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Abundant, PerfectNumbers.Classify(12));
    }

    [Fact]
    public void Medium_abundant_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Abundant, PerfectNumbers.Classify(30));
    }

    [Fact]
    public void Large_abundant_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Abundant, PerfectNumbers.Classify(33550335));
    }

    [Fact]
    public void Smallest_prime_deficient_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Deficient, PerfectNumbers.Classify(2));
    }

    [Fact]
    public void Smallest_non_prime_deficient_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Deficient, PerfectNumbers.Classify(4));
    }

    [Fact]
    public void Medium_deficient_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Deficient, PerfectNumbers.Classify(32));
    }

    [Fact]
    public void Large_deficient_number_is_classified_correctly()
    {
        Assert.Equal(Classification.Deficient, PerfectNumbers.Classify(33550337));
    }

    [Fact]
    public void Edge_case_no_factors_other_than_itself_is_classified_correctly()
    {
        Assert.Equal(Classification.Deficient, PerfectNumbers.Classify(1));
    }

    [Fact]
    public void Zero_is_rejected_not_a_natural_number_()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => PerfectNumbers.Classify(0));
    }

    [Fact]
    public void Negative_integer_is_rejected_not_a_natural_number_()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => PerfectNumbers.Classify(-1));
    }
}