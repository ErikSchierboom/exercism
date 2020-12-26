using System;

public static class ResistorColorDuo
{
    public enum ResistorColor
    {
        Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White
    }

    public static int Value(string[] colors) => Value(colors[0]) * 10 + Value(colors[1]);

    private static int Value(string color) => (int)Enum.Parse<ResistorColor>(color, ignoreCase: true);
}
