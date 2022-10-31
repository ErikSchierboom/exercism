using System.Collections.Generic;
using System.Linq;

public static class Luhn
{
    public static bool IsValid(string number)
    {
        var addends = GetDigits(number).Reverse().Select(GetDigitValue).Reverse();
        var checksum = addends.Sum();
        return checksum % 10 == 0;
    }

    private static IEnumerable<int> GetDigits(string number) => number.Select(c => c - '0');

    private static int GetDigitValue(int digit, int index)
    {
        if (index % 2 == 0)
        {
            return digit;
        }

        var doubledValue = digit * 2;
        return doubledValue > 9 ? doubledValue - 9 : doubledValue;
    }
}