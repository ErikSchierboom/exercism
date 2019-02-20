using System;

public static class ResistorColor
{
    private static readonly string[] ResistorColors = { "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" };

    public static int ColorCode(string color) => Array.IndexOf(ResistorColors, color);

    public static string[] Colors() => ResistorColors;
}