using System.Globalization;

public static class Raindrops
{
    public static string Convert(int number)
    {
        var convertedNumber = string.Empty;

        if (number % 3 == 0)
        {
            convertedNumber += "Pling";
        }

        if (number % 5 == 0)
        {
            convertedNumber += "Plang";
        }

        if (number % 7 == 0)
        {
            convertedNumber += "Plong";
        }

        return convertedNumber == string.Empty ? number.ToString(CultureInfo.InvariantCulture) : convertedNumber;
    }
}