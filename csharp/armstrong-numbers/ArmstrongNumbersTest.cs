// This file was auto-generated based on version 1.0.0 of the canonical data.

using Xunit;

public class ArmstrongNumbersTest
{
    [Fact]
    public void Single_digit_numbers_are_armstrong_numbers()
    {
        Assert.True(ArmstrongNumbers.IsArmstrongNumber(5));
    }

    [Fact]
    public void There_are_no_2_digit_armstrong_numbers()
    {
        Assert.False(ArmstrongNumbers.IsArmstrongNumber(10));
    }

    [Fact]
    public void Three_digit_number_that_is_an_armstrong_number()
    {
        Assert.True(ArmstrongNumbers.IsArmstrongNumber(153));
    }

    [Fact]
    public void Three_digit_number_that_is_not_an_armstrong_number()
    {
        Assert.False(ArmstrongNumbers.IsArmstrongNumber(100));
    }

    [Fact]
    public void Four_digit_number_that_is_an_armstrong_number()
    {
        Assert.True(ArmstrongNumbers.IsArmstrongNumber(9474));
    }

    [Fact]
    public void Four_digit_number_that_is_not_an_armstrong_number()
    {
        Assert.False(ArmstrongNumbers.IsArmstrongNumber(9475));
    }

    [Fact]
    public void Seven_digit_number_that_is_an_armstrong_number()
    {
        Assert.True(ArmstrongNumbers.IsArmstrongNumber(9926315));
    }

    [Fact]
    public void Seven_digit_number_that_is_not_an_armstrong_number()
    {
        Assert.False(ArmstrongNumbers.IsArmstrongNumber(9926314));
    }
}