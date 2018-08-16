using System;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        var numberAsString = number.ToString();
        return numberAsString.Select(CharToInt).Sum(IntRaisedToPower) == number;

        int IntRaisedToPower(int i) => (int) Math.Pow(i, numberAsString.Length);
        int CharToInt(char c) => c - '0';
    }
}