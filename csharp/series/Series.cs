using System;
using System.Collections.Generic;
using System.Linq;

public class Series
{
    private readonly IList<int> digits;

    public Series(string input)
    {
        if (InInvalidInput(input))
        {
            throw new ArgumentException("Invalid input.", "input");
        }

        digits = input.Select(c => c - '0').ToList();
    }

    public IEnumerable<IEnumerable<int>> Slices(int length)
    {
        if (length > digits.Count)
        {
            throw new ArgumentException("length must not exceed input length.", "length");
        }

        return Enumerable.Range(0, GetMaximumIndex(length)).Select(i => GetSlice(i, length));
    }

    private int GetMaximumIndex(int length)
    {
        return digits.Count - (length - 1);
    }

    private IEnumerable<int> GetSlice(int index, int length)
    {
        return digits.Skip(index).Take(length);
    }

    private static bool InInvalidInput(string input)
    {
        return string.IsNullOrWhiteSpace(input) || !input.All(char.IsDigit);
    }
}