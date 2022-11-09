using System.Collections.Generic;
using System.Globalization;
using System.Linq;

public static class Luhn
{
    public static bool IsValid(string number)
    {
        var sanitizedNumber = number.Sanitize(); 
        return sanitizedNumber.Valid() && sanitizedNumber.Checksum() % 10 == 0;
    }

    private static string Sanitize(this string number) => number.Replace(" ", "");
    private static bool Valid(this string number) => number.All(char.IsDigit) && number.Length > 1;
    private static int Checksum(this string number) => number.Addends().Sum();
    private static IEnumerable<int> Addends(this string number) => number.Digits().Select((digit, i) =>
    {
        if ((number.Length - i + 1) % 2 == 0)
            return digit;

        return digit >= 5 ? digit * 2 - 9 : digit * 2;
    });
    
    private static IEnumerable<int> Digits(this string number) => number.Select(CharUnicodeInfo.GetDigitValue);
}