using System.Linq;

public static class Hexadecimal
{
    private const string HexChars = "0123456789ABCDEF";
    private const int InvalidHexValue = 0;

    public static int ToDecimal(string hex)
    {
        if (IsValidHexString(hex))
        {
            return hex.Aggregate(0, (acc, digit) => acc * 16 + HexCharToDecimal(digit));
        }

        return InvalidHexValue;
    }

    private static bool IsValidHexString(string hex)
    {
        return hex.ToUpperInvariant().All(HexChars.Contains);
    }

    private static int HexCharToDecimal(char hexChar)
    {
        if (char.IsDigit(hexChar))
        {
            return hexChar - '0';
        }

        return (char.ToUpperInvariant(hexChar) - 'A') + 10;
    }
}