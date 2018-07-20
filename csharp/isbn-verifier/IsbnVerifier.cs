using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class IsbnVerifier
{
    public static bool IsValid(string number)
    {
        var normalizedNumber = NormalizeNumber(number);
        if (!IsValidNumber(normalizedNumber))
        {
            return false;
        }

        return Checksum(normalizedNumber) % 11 == 0;
    }

    private static string NormalizeNumber(string number) => number.Replace("-", "");

    private static bool IsValidNumber(string normalizedNumber) => Regex.IsMatch(normalizedNumber, @"^\d{9}[\dX]$");

    private static int Checksum(string normalizedNumber) 
        => normalizedNumber
            .Reverse()
            .Select((digit, i) => DigitToInt(digit) * (i + 1))
            .Sum();

    private static int DigitToInt(char digit) => digit == 'X' ? 10 : digit - '0';
}