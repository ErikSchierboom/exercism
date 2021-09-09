using System;
using Xunit;

public class CollatzConjectureTests
{
    [Fact]
    public void Zero_steps_for_one()
    {
        Assert.Equal(0, CollatzConjecture.Steps(1));
    }

    [Fact]
    public void Divide_if_even()
    {
        Assert.Equal(4, CollatzConjecture.Steps(16));
    }

    [Fact]
    public void Even_and_odd_steps()
    {
        Assert.Equal(9, CollatzConjecture.Steps(12));
    }

    [Fact]
    public void Large_number_of_even_and_odd_steps()
    {
        Assert.Equal(152, CollatzConjecture.Steps(1000000));
    }

    [Fact]
    public void Zero_is_an_error()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => CollatzConjecture.Steps(0));
    }

    [Fact]
    public void Negative_value_is_an_error()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => CollatzConjecture.Steps(-15));
    }
}