using System;
using System.Collections.Generic;

public static class Series
{
    public static IEnumerable<string> Slices(string input, int length)
    {
        if (length < 1 || length > input.Length)
            throw new ArgumentException("Invalid slice length", nameof(length));

        for (var i = 0; i < input.Length - length + 1; i++)
            yield return input[i..(i + length)];
    }
}