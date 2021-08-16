using System.Linq;
using System.Text.RegularExpressions;

public static class IsbnVerifier
{
    public static bool IsValid(string number)
    {
        var normalizedNumber = SanitizeNumber(number);
        return IsValidNumber(normalizedNumber) && Checksum(normalizedNumber) % 11 == 0;
    }

    private static string SanitizeNumber(string number) => number.Replace("-", "");

    private static bool IsValidNumber(string normalizedNumber) => Regex.IsMatch(normalizedNumber, @"^\d{9}[\dX]$");

    private static int Checksum(string normalizedNumber) =>
        normalizedNumber
            .Reverse()
            .Select((digit, i) => DigitToValue(digit) * (i + 1))
            .Sum();

    private static int DigitToValue(char digit) => digit == 'X' ? 10 : digit - '0';
}