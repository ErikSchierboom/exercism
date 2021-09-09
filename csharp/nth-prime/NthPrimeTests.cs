using System;
using Xunit;

public class NthPrimeTests
{
    [Fact]
    public void First_prime()
    {
        Assert.Equal(2, NthPrime.Prime(1));
    }

    [Fact]
    public void Second_prime()
    {
        Assert.Equal(3, NthPrime.Prime(2));
    }

    [Fact]
    public void Sixth_prime()
    {
        Assert.Equal(13, NthPrime.Prime(6));
    }

    [Fact]
    public void Big_prime()
    {
        Assert.Equal(104743, NthPrime.Prime(10001));
    }

    [Fact]
    public void There_is_no_zeroth_prime()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => NthPrime.Prime(0));
    }
}