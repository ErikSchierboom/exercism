using System;

public static class ResistorColorTrio
{
    public enum ResistorColor
    {
        Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White
    }

    public static string Label(string[] colors)
    {
        var value = Value(colors);
        return value >= 1000 ? $"{value / 1000} kiloohms" : $"{value} ohms";;
    }

    private static int Value(string[] colors) => (Value(colors[0]) * 10 + Value(colors[1])) * (int)Math.Pow(10, Value(colors[2]));

    private static int Value(string color) => (int)Enum.Parse<ResistorColor>(color, ignoreCase: true);
}
