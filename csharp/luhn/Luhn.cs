using System.Linq;

public static class Luhn
{
    public static bool IsValid(string input)
    {
        var digits = GetDigits(input.Replace(" ", ""));
        if (digits.Length < 2)
            return false;
        
        var checksum = digits
            .Reverse()
            .Select(GetDigitValue)
            .Reverse()
            .Sum();
        
        return checksum % 10 == 0;
    }
    
    private static int[] GetDigits(string input) => input.Select(c => c - '0').ToArray();

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