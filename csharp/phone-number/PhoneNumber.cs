using System;
using System.Collections.Generic;
using System.Linq;

public static class PhoneNumber
{
    public static string Clean(string phoneNumber)
    {
        var digits = Digits(phoneNumber);

        if (InvalidAreaCode(digits) || InvalidExchangeCode(digits))
            throw new ArgumentException();

        return new string(digits);
    }

    private static char[] Digits(string phoneNumber)
    {
        var digits = phoneNumber.Where(char.IsDigit).ToArray();

        if (digits.Length == 10)
            return digits;

        if (digits.Length == 11 && digits[0] == '1')
            return digits.Skip(1).ToArray();

        throw new ArgumentException();
    }

    private static bool InvalidAreaCode(IReadOnlyList<char> digits) => digits[0] == '0' || digits[0] == '1';
    
    private static bool InvalidExchangeCode(IReadOnlyList<char> digits) => digits[3] == '0' || digits[3] == '1';
}