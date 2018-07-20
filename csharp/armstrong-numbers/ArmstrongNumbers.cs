using System;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        var digits = number.ToString().Select(CharToInt).ToArray();
        var digitsRaisedToPowerSum = digits.Sum(digit => Math.Pow(digit, digits.Length));

        return digitsRaisedToPowerSum == number;
    }

    private static int CharToInt(char c) => c - '0';
}