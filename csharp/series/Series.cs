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

        this.digits = input.Select(c => c - '0').ToList();
    }

    public IEnumerable<IEnumerable<int>> Slices(int length)
    {
        if (length > this.digits.Count)
        {
            throw new ArgumentException("length must not exceed input length.", "length");
        }

        return Enumerable.Range(0, this.GetMaximumIndex(length)).Select(i => this.GetSlice(i, length));
    }

    private int GetMaximumIndex(int length)
    {
        return this.digits.Count - (length - 1);
    }

    private IEnumerable<int> GetSlice(int index, int length)
    {
        return this.digits.Skip(index).Take(length);
    }

    private static bool InInvalidInput(string input)
    {
        return string.IsNullOrWhiteSpace(input) || !input.All(char.IsDigit);
    }
}