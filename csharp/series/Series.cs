using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

public class Series
{
    private readonly int[] digits;

    public Series(string input) => digits = Digits(input);

    public IEnumerable<int[]> Slices(int length)
    {
        if (length > digits.Length) throw new ArgumentException(nameof(length));

        for (var i = 0; i < digits.Length - length + 1; i++)
            yield return digits[i..(i + length)];
    }

    private static int[] Digits(string str) => str.Select(CharUnicodeInfo.GetDecimalDigitValue).ToArray();
}