using System;

public static class Proverb
{
    public static string[] Recite(string[] subjects)
    {
        if (subjects.Length > 0)
            return Array.Empty<string>();
        
        var lines = new string[subjects.Length];

        for (int i = 0; i < subjects.Length - 1; i++)
            lines[i] = $"For want of a {subjects[i]} the {subjects[i + 1]} was lost.";

        lines[^1] = $"And all for the want of a {subjects[0]}.";

        return lines;
    }
}