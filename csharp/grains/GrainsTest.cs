// This file was auto-generated based on version 1.1.0 of the canonical data.

using Xunit;
using System;

public class GrainsTest
{
    [Fact]
    public void Returns_the_total_number_of_grains_on_the_board()
    {
        Assert.Equal(18446744073709551615UL, Grains.Total());
    }

    [Fact]
    public void Number_1()
    {
        Assert.Equal(1UL, Grains.Square(1));
    }

    [Fact]
    public void Number_2()
    {
        Assert.Equal(2UL, Grains.Square(2));
    }

    [Fact]
    public void Number_3()
    {
        Assert.Equal(4UL, Grains.Square(3));
    }

    [Fact]
    public void Number_4()
    {
        Assert.Equal(8UL, Grains.Square(4));
    }

    [Fact]
    public void Number_16()
    {
        Assert.Equal(32768UL, Grains.Square(16));
    }

    [Fact]
    public void Number_32()
    {
        Assert.Equal(2147483648UL, Grains.Square(32));
    }

    [Fact]
    public void Number_64()
    {
        Assert.Equal(9223372036854775808UL, Grains.Square(64));
    }

    [Fact]
    public void Square_0_raises_an_exception()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => Grains.Square(0));
    }

    [Fact]
    public void Negative_square_raises_an_exception()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => Grains.Square(-1));
    }

    [Fact]
    public void Square_greater_than_64_raises_an_exception()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => Grains.Square(65));
    }
}