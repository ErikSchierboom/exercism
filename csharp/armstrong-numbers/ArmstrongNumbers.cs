﻿using System;
using System.Globalization;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int n) => ArmstrongSum(n) == n;

    private static int ArmstrongSum(int n)
    {
        var digits = Digits(n);
        return (int)digits.Sum(digit => Math.Pow(digit, digits.Length));
    }

    private static int[] Digits(int n) => n.ToString().Select(CharUnicodeInfo.GetDecimalDigitValue).ToArray();
}